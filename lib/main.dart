import 'package:flutter/material.dart';
// import 'package:technewzapp/pages/home.dart';
import 'package:technewzapp/pages/splashscreen.dart';
import 'package:technewzapp/utils/colors.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary
      ),
      home: SplashScreen(),
    );
  }
}