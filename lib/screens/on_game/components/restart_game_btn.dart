import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo/screens/on_game/on_game_provider.dart';
import '../../../core/constants/constants.dart';

class RestartGameBtn extends StatelessWidget {
  const RestartGameBtn({super.key, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<OnGameProvider>().resetGame(),
      child: const Text('Reset Game',style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w900,
          fontFamily: fontKanit,
          color: Colors.blue
      ),),
    );
  }
}
