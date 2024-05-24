import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo/screens/on_game/on_game_provider.dart';
import '../../../core/constants/constants.dart';
import '../../../core/screen size/screen_size.dart';

class XoBox extends StatelessWidget {
  const XoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnGameProvider>(builder: (context, provider, child) {
      final state = provider.state;
      return SizedBox(
        height: height(context) / 1.7,
        width: width(context) / 1.03,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => provider.onTap(index),
              child: Container(
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    state.board[index],
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                      fontFamily: fontKanit,
                      color: state.board[index] == 'X'
                          ? Colors.blue
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
