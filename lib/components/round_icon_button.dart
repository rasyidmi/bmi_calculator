import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function iconFunction;

  RoundIconButton({this.iconData, this.iconFunction});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        iconData,
        color: Colors.white,
      ),
      onPressed: iconFunction,
      elevation: 1.0,
      fillColor: kPrimaryColor,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
    );
  }
}
