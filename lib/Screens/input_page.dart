import 'package:bmi_calculator/Screens/results.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/cardproperties1.dart';
import 'package:bmi_calculator/components/reuseableCard.dart';
import 'package:bmi_calculator/components/roundiconbutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'package:bmi_calculator/bmiBrain.dart';

enum GenderType { male, female }
int height = 120;
var weight = 60;
int age = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType genderType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusablecard(
                    onPress: () {
                      setState(() {
                        genderType = GenderType.male;
                      });
                    },
                    color: genderType == GenderType.male
                        ? kactivecardcolor
                        : kinactivecardcolor,
                    cardChild: CardProperties1(
                      gender: "Male",
                      genderIcon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: Reusablecard(
                    onPress: () {
                      setState(() {
                        genderType = GenderType.female;
                      });
                    },
                    color: genderType == GenderType.female
                        ? kactivecardcolor
                        : kinactivecardcolor,
                    cardChild: CardProperties1(
                      gender: "Female",
                      genderIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusablecard(
              color: kinactivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: klabelTextStyle,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: ksliderTextStyle,
                      ),
                      Text(
                        "cm",
                        style: klabelTextStyle,
                      )
                    ],
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        overlayColor: Color(0x42eb1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                        max: 200,
                        min: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusablecard(
                    color: kactivecardcolor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: klabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: ksliderTextStyle,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onTap: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                onTap: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusablecard(
                    color: kactivecardcolor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: ksliderTextStyle,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onTap: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                onTap: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            calculate: "Calculate",
            navigate: () {
              BMIBrain calc = BMIBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      interpretation: calc.getInterpretation(),
                      resultText: calc.getResult(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
