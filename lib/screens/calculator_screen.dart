import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/components/icon_content.dart';
import '../widgets/components/reusable_bg.dart';
import '../widgets/components/round_icon_button.dart';
import '../widgets/constants.dart';
import 'calculator_result_screen.dart';
import '../widgets/components/bottom_container_button.dart';
import '../helpers/calculator_brain.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

//Die Aufzählung legt die Handlung der Zahlen auf implezite Weise fest. (der BMI ist Geschlechtsabhängig)
enum Gender {
  male,
  female,
}

//Generiert den eingabe Screen für die Angaben welche für die BMI-Berechnung benötigt wird.
//Letzte eingabe sollte im Profile gespeichert sein. (Momentan immer fix auf Mänlich, 180cm, 50kg und 20 Jahre)
class _CalculatorScreenState extends State<CalculatorScreen> {
  late Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 50;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableBg(
                    colour: selectedGender == Gender.male
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild: IconContent(
                        myicon: FontAwesomeIcons.mars, text: 'Mänlich'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableBg(
                    colour: selectedGender == Gender.female
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild: IconContent(
                        myicon: FontAwesomeIcons.venus, text: 'Weiblich'),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableBg(
            colour: kactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Körpergrösse',
                  style: klabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kDigitTextStyle,
                    ),
                    const Text(
                      'cm',
                      style: klabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: ksliderInactiveColor,
                    thumbColor: const Color(0xFFEB1555),
                    overlayColor: const Color(0x29EB1555),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 35.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableBg(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Gewicht',
                        style: klabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kDigitTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight == 0 ? weight = 0 : weight--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableBg(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Alter',
                        style: klabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kDigitTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age == 0 ? age = 0 : age--;
                              });
                            },
                          ),
                          const SizedBox(width: 15.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        //Startet die BMI-Berechnung und giebt die Resultate aus
        BottomContainer(
          text: 'Berechnen',
          onTap: () {
            Calculate calc = Calculate(height: height, weight: weight);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  bmi: calc.result(),
                  resultText: calc.getText(),
                  advise: calc.getAdvise(),
                  textColor: calc.getTextColor(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
