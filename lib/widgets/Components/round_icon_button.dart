import 'package:flutter/material.dart';

//definiert runde Icons zum wiederverwenden
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const RoundIconButton(
      {super.key, required this.icon, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      // ignore: sort_child_properties_last
      child: Icon(icon, color: Colors.white),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 0.0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: const Color(0xFF4C4F5E),
    );
  }
}
