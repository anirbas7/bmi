import 'package:bmi/widgets/components/bottom_container_button.dart';
import 'package:bmi/widgets/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/components/reusable_bg.dart';

class ResultPage extends StatelessWidget {
  final String resultText;
  final String bmi;
  final String advise;
  final Color textColor;

//wurde von Visual Studio selbst kommentiert
  // ignore: prefer_const_constructors_in_immutables
  ResultPage(
      {required this.textColor,
      required this.resultText,
      required this.bmi,
      required this.advise});

//gibt das Resultat der Rechnung aus inklusive einen Tip und in welcher Range der optimale BMI sich befinden sollte
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kactiveCardColor,
        title: Text('Dein Resultat'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: ReusableBg(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmi,
                    style: kBMITextStyle,
                  ),
                  Text(
                    'Normal BMI range:',
                    style: klabelTextStyle,
                  ),
                  Text(
                    '18.5 - 25 kg/m2',
                    style: klabelTextStyle,
                  ),
                  Text(
                    advise,
                    textAlign: TextAlign.center,
                    style: klabelTextStyle,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    constraints: BoxConstraints.tightFor(
                      width: 200.0,
                      height: 56.0,
                    ),
                    fillColor: Color(0xFF4C4F5E),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      //speicherfunktion vorgesehen funktioniert momentan nicht
                      'Resultat speichern',
                      style: kBodyTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(
              text: 'Erneut Berechnen',
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
