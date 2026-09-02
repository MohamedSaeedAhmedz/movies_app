import 'package:flutter/material.dart';
import 'package:movies_app/features/onboarding/presentation/onboarding_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'MoviesApp',
      theme: ThemeData(

      ),

    home: OnboardingView(),
    );
  }
}
