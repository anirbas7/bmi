import 'package:flutter/material.dart';

//wieder verwendbarer block (verwendet beim eingabe screen und resultat)
class ReusableBg extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const ReusableBg(
      {super.key,
      required this.colour,
      required this.cardChild}); //remove required
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: sort_child_properties_last
      child: cardChild,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
