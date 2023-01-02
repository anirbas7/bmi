import 'dart:math';
import 'package:flutter/material.dart';

//Berechnet den BMI mit den Eingaben aus der App (geschlecht und alter werden momentan nicht beachtet!)
class Calculate {
  Calculate({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 0;

  String result() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

//gibt an ob der BMI unter-, über- oder normalgewichtig ist
  String getText() {
    if (_bmi >= 25) {
      return 'Übergewichtig';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Untergewichtig';
    }
  }

//Gibt einen Hinweis über den BMI aus
  String getAdvise() {
    if (_bmi >= 25) {
      return 'Dein BMI liegt über der normalen BMI-Range.\n Versuche mehr zu Trainieren.';
    } else if (_bmi > 18.5) {
      return 'Dein BMI liegt im normalen BMI-Range.\nGood job!';
    } else {
      return 'Dein BMI liegt unter der normalen BMI-Range.\n Versuche mehr zu essen.';
    }
  }

// definiert die TextFarbe je nach Wert.
  Color getTextColor() {
    if (_bmi >= 25 || _bmi <= 18.5) {
      return Colors.deepOrangeAccent;
    } else {
      return const Color(0xFF24D876);
    }
  }
}
