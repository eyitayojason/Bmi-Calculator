import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/reuseableCard.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmiResult, this.interpretation, this.resultText});

  final String? bmiResult;
  final String? resultText;
  final String? interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI RESULTS"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                  "Your Result",
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              child: Reusablecard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      resultText!.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult!,
                      textAlign: TextAlign.center,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation!,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
                color: kactivecardcolor,
              ),
              flex: 5,
            ),
            BottomButton(
              calculate: "Re-Calculate",
              navigate: () {
                Navigator.of(context).pop();
              },
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
    );
  }
}
