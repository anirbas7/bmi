import 'package:flutter/material.dart';
import 'package:bmi/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Startet die BMI-App
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const LoginScreen(),
    );
  }
}
