import 'package:bmi_calculator/Screens/input_page.dart';
import 'package:flutter/material.dart';

GenderType? genderType;

class Reusablecard extends StatelessWidget {
  Reusablecard({
    @required this.color,
    this.cardChild,
    this.onPress,
  });
  final Color? color;
  final cardChild;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress!();
      },
      child: Container(
        height: double.infinity,
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
      ),
    );
  }
}
