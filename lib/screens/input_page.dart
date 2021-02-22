import 'file:///D:/LATIHAN_NGODING/FLUTTER/bmi_calculator/lib/components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/card_widget.dart';
import '../components/gender_column.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 160;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    color: selectedGender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: GenderColumn(
                      genderIcon: FontAwesomeIcons.mars,
                      genderText: 'MALE',
                      genderColor: selectedGender == GenderType.male
                          ? kCardIconColor
                          : kCardInactiveIconColor,
                      textStyling: selectedGender == GenderType.male
                          ? kCardTextStyling
                          : kInactiveCardTextStyling,
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    color: selectedGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: GenderColumn(
                      genderIcon: FontAwesomeIcons.venus,
                      genderText: 'FEMALE',
                      genderColor: selectedGender == GenderType.female
                          ? kCardIconColor
                          : kCardInactiveIconColor,
                      textStyling: selectedGender == GenderType.female
                          ? kCardTextStyling
                          : kInactiveCardTextStyling,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kCardTextStyling,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kCardNumberStyling,
                      ),
                      Text(
                        'cm',
                        style: kCardTextStyling,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: Color(0xFF4b50e3),
                      overlayColor: Color(0x294b50e3),
                      activeTrackColor: kCardIconColor,
                      inactiveTrackColor: kCardInactiveIconColor,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 60.0,
                      max: 300.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              color: kInactiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kCardTextStyling,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kCardNumberStyling,
                            ),
                            Text(
                              'kg',
                              style: kCardTextStyling,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              iconFunction: () {
                                setState(() {
                                  weight > 0 ? weight-- : null;
                                });
                              },
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              iconFunction: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReuseCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kCardTextStyling,
                        ),
                        Text(
                          age.toString(),
                          style: kCardNumberStyling,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              iconFunction: () {
                                setState(() {
                                  age > 0 ? age-- : null;
                                });
                              },
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              iconFunction: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE',
            buttonFunction: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              calc.calculateBMI();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    resultNumber: calc.getBMINumber(),
                    resultDesc: calc.getBMIDesc(),
                    resultTitle: calc.getBMITitle(),
                  ),
                ),
              );

              // Navigator.pushNamed(
              //   context,
              //   '/calculate',
              //   arguments: ResultsPage(
              //     resultNumber: 'OVERWEIGHT',
              //     resultTitle: 'TITLE',
              //     resultDesc: 'DESC',
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
