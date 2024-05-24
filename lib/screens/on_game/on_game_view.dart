import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo/screens/on_game/components/restart_game_btn.dart';
import 'package:xo/screens/on_game/components/row_difficulty_texts.dart';
import 'package:xo/screens/on_game/components/status_message.dart';
import 'package:xo/screens/on_game/components/xoBox.dart';
import 'on_game_provider.dart';

class OnGamePage extends StatelessWidget {
  const OnGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OnGameProvider()..initState(),
      child: buildPage(context),
    );
  }

  Widget buildPage(BuildContext context) {
    return const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RowDifficultyTexts(),
            StatusMessage(),
            XoBox(),
            RestartGameBtn(),
          ],
        ),
      );
  }
}
