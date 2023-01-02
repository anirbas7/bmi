import 'package:bmi/screens/calculator_screen.dart';
import 'package:bmi/screens/profile_screen.dart';
import 'package:bmi/screens/suggestion_screen.dart';
import 'package:bmi/widgets/constants.dart';
import 'package:flutter/material.dart';

//erstellt die Navbar und dessen Status
class NavbarScreen extends StatefulWidget {
  const NavbarScreen({Key? key}) : super(key: key);

  @override
  _NavbarScreenState createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _selectedTab = 0;

  final List _pages = [
    const CalculatorScreen(),
    const SuggestionScreen(),
    ProfileScreen()
  ];

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
              icon: Icon(Icons.tips_and_updates), label: "Ernährungsberatung"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "About"),
        ],
      ),
    );
  }
}
