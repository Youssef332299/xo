import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:xo/core/assets/sounds.dart';
import 'on_game_state.dart';

class OnGameProvider extends ChangeNotifier {
  OnGameState state = OnGameState();

  void initState() {
    resetGame();
  }

  void resetGame() {
    state.board = List.filled(9, '');
    state.isX = true;
    state.message = 'Player X turn';
    notifyListeners();
  }

  void onTap(index) {
    if (state.message == 'Player X turn') {
      state.player.play(AssetSource(SoundsNames.tapSound));
    }

    if (state.board[index] == '' && !checkWinner('X') && !checkWinner('O')) {
      setMove(index);
    }
    notifyListeners();
  }

  void setMove(int index) {
    if (state.board[index] == '') {
      state.board[index] = state.isX ? 'X' : 'O';
      state.isX = !state.isX;
      state.message = 'Player ${state.isX ? 'X' : 'O'} turn';
      notifyListeners();
      checkGameState();
    }
  }

  void checkGameState() {
    if (checkWinner('X')) {
      state.player.play(AssetSource(SoundsNames.winSound));
      state.message = 'Player x win 🥇';
    } else if (checkWinner('O')) {
      state.player.play(AssetSource(SoundsNames.winSound));
      state.message = 'Player O win 🥇';
    } else if (!state.board.contains('')) {
      state.message = 'Draw 🤝';
    } else if (state.isSinglePlayer && !state.isX) {
      makeComputerMove();
    }
  }

  bool checkWinner(String player) {
    List<List<int>> lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    for (var line in lines) {
      if (state.board[line[0]] == player &&
          state.board[line[1]] == player &&
          state.board[line[2]] == player) {
        return true;
      }
    }
    return false;
  }

  void makeComputerMove() {
    Future.delayed(const Duration(milliseconds: 700), () {
      if (state.difficulty == 'easy') {
        makeRandomMove();
      } else if (state.difficulty == 'hard') {
        makeBestMove();
      }
    });
  }

  void makeRandomMove() {
    var emptyIndices = <int>[];
    for (int i = 0; i < state.board.length; i++) {
      if (state.board[i] == '') emptyIndices.add(i);
    }
    if (emptyIndices.isNotEmpty) {
      var random = Random();
      int move = emptyIndices[random.nextInt(emptyIndices.length)];
      setMove(move);
    }
  }

  void makeBestMove() {
    int bestScore = -1000;
    int bestMove = -1;

    for (int i = 0; i < state.board.length; i++) {
      if (state.board[i] == '') {
        state.board[i] = 'O';
        int score = minimax(state.board, 0, false);
        state.board[i] = '';
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }
    if (bestMove != -1) {
      setMove(bestMove);
    }
  }

  int minimax(List<String> board, int depth, bool isMaximizing) {
    if (checkWinner('O')) return 10 - depth;
    if (checkWinner('X')) return depth - 10;
    if (!board.contains('')) return 0;
    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < board.length; i++) {
        if (board[i] == '') {
          board[i] = 'O';
          int score = minimax(board, depth + 1, false);
          board[i] = '';
          bestScore = max(score, bestScore);
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < board.length; i++) {
        if (board[i] == '') {
          board[i] = 'X';
          int score = minimax(board, depth + 1, true);
          board[i] = '';
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    }
  }

  onTapText(String text) {
    if (text == 'easy') {
      state.isSinglePlayer = true;
      state.difficulty = 'easy';
    } else if (text == 'hard') {
      state.isSinglePlayer = true;
      state.difficulty = 'hard';
    } else {
      state.isSinglePlayer = false;
      state.difficulty = '';
    }
    notifyListeners();
    resetGame();
  }
}
