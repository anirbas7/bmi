import 'package:bmi/widgets/constants.dart';
import 'package:flutter/material.dart';

//voller Text zu den ERnährungstips.
// Momentan ebenfalls nur Testtexte und bilder
class RecipeDetailScreen extends StatefulWidget {
  const RecipeDetailScreen({super.key, this.recipe});
  final recipe;

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kactiveCardColor,
        title: Text(widget.recipe['name']),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                widget.recipe['image'],
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                widget.recipe['description'],
                style: klabelTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
