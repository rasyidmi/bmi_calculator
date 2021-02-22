import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function buttonFunction;

  BottomButton({@required this.buttonText, this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFunction,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: kBottomButtonStyling,
          ),
        ),
        margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
        width: double.infinity,
        height: kBottomBoxHeight,
        decoration: BoxDecoration(
          color: kBottomBoxColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
