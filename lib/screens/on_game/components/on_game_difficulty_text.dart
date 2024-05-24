// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:xo/core/constants/constants.dart';

class OnGameDifficultyText extends StatelessWidget {
  OnGameDifficultyText({
    super.key,
    required this.onTap,
    required this.difficultyText,
    required this.text
  });

  String text;
  Function onTap;
  bool difficultyText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 300),
        style: TextStyle(
          fontSize: difficultyText ? 40.0 : 18.0,
          color: difficultyText ? Colors.blue : Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: fontKanit,
        ),
        child: Text(text),
      ),
    );
  }
}
