import 'package:bmi/Screens/CalculatorScreen.dart';
import 'package:bmi/Screens/ProfileScreen.dart';
import 'package:bmi/Screens/SuggestionScreen.dart';
import 'package:bmi/auth/SignUpScreen.dart';
import 'package:bmi/main.dart';
import 'package:bmi/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  List _pages = [InputPage(), SuggestionScreen(), ProfilePage()];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedTab]),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        backgroundColor: kactiveCardColor,
        selectedItemColor: kbottomContainerColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3_outlined), label: "Product"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "About"),
        ],
      ),
    );
  }
}
