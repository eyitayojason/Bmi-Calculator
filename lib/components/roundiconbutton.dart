import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onTap});

  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      elevation: 10,
      child: Icon(icon),
      onPressed: onTap,
      enableFeedback: true,
      constraints: BoxConstraints().tighten(width: 56, height: 56),
    );
  }
}
