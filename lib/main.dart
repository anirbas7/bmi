import 'package:flutter/material.dart';
import 'package:bmi/Screens/CalculatorScreen.dart';
import 'package:bmi/Screens/HomeScreen.dart';
import 'package:bmi/auth/LoginScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:bmi/auth/authentication.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: LoginScreen(),
    );
  }
}
