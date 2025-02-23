import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:technewzapp/pages/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: LottieBuilder.asset('assets/News.json'))
        ],
      ),
      splashIconSize: 500,
      backgroundColor: Colors.cyan.shade100,
      nextScreen: Home(),
    );
  }
}