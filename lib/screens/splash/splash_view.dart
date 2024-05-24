import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/assets/lottie_names.dart';
import 'splash_provider.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SplashProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<SplashProvider>();
    final state = provider.state;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Lottie.asset(LottieTitles.splashLottie,
              onLoaded: (lottieComposition) =>
                  provider.lottieComposition(context)),
        ));
  }
}
