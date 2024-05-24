import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/constants.dart';
import '../on_game_provider.dart';

class StatusMessage extends StatelessWidget {
  const StatusMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnGameProvider>(builder: (context, provider, child) {
      final state = provider.state;
      return Center(
        child: Text(
          state.message,
          style: TextStyle(
              fontSize: 25,
              color: state.message == 'Player x win 🥇' ||
                      state.isX && state.message != 'Player O win 🥇'
                  ? Colors.blue
                  : Colors.black,
              fontFamily: fontKanit,
              fontWeight: FontWeight.w900),
        ),
      );
    });
  }
}
