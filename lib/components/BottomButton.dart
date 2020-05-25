import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String calculate;
  final Function navigate;
  BottomButton({this.calculate, this.navigate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigate,
      child: Container(
        child: Center(
          child: Text(
            calculate,
            style: kLargeButtonText,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomContainerheight,
        color: kbottomContainerColor,
      ),
    );
  }
}
