import 'package:flutter/material.dart';
import '../constants.dart';

const sizedBox = SizedBox(
  height: 15.0,
);
//definiert die Icons
const iconSize = 80.0;

class IconContent extends StatelessWidget {
  final IconData myicon;
  final String text;
  const IconContent({super.key, required this.myicon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          myicon,
          size: iconSize,
          color: Colors.white,
        ),
        sizedBox,
        Text(
          text,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}
