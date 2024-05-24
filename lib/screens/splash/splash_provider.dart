import 'package:flutter/material.dart';

import '../on_game/on_game_view.dart';
import 'splash_state.dart';

class SplashProvider extends ChangeNotifier {
  SplashState state = SplashState();

  void lottieComposition(context) {
    Future.delayed(const Duration(milliseconds: 1200), () {
      Navigator.of(context).pushAndRemoveUntil(
        onLoaded(), (route) => false,
      );
    });
  }

  onLoaded() {
    return PageRouteBuilder(
      reverseTransitionDuration: const Duration(milliseconds: 210),
      transitionDuration: const Duration(milliseconds: 210),
      pageBuilder: (context, animation,
          secondaryAnimation) => const OnGamePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        final slide = animation.drive(tween);
        return SlideTransition(
          position: slide,
          child: child,
        );
      },
    );
  }

}
