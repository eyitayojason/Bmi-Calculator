import 'package:flutter/material.dart';

const double genderIconSize = 80;

class CardProperties1 extends StatelessWidget {
  CardProperties1({this.gender, this.genderIcon});
  final IconData genderIcon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          genderIcon,
          size: genderIconSize,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xff8d8e98),
          ),
        )
      ],
    );
  }
}
