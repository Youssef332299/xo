import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../on_game_provider.dart';
import 'on_game_difficulty_text.dart';

class RowDifficultyTexts extends StatelessWidget {
  const RowDifficultyTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnGameProvider>(builder: (context, provider, child) {
      final state = provider.state;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OnGameDifficultyText(
              onTap: () => provider.onTapText('easy'),
              difficultyText: state.difficulty == 'easy' ? true : false,
              text: 'Easy'),
          OnGameDifficultyText(
              onTap: () => provider.onTapText('hard'),
              difficultyText: state.difficulty == 'hard' ? true : false,
              text: 'Hard'),
          OnGameDifficultyText(
              onTap: () => provider.onTapText('Two Players'),
              difficultyText: !state.isSinglePlayer,
              text: '2 Players'),
        ],
      );
    });
  }
}
