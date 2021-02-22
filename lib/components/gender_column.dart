import 'package:flutter/material.dart';
import '../constants.dart';

class GenderColumn extends StatelessWidget {
  final genderIcon;
  final String genderText;
  final Color genderColor;
  final textStyling;

  GenderColumn(
      {@required this.genderIcon,
      @required this.genderText,
      this.genderColor,
      this.textStyling});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 70.0,
          color: genderColor,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          genderText,
          style: textStyling,
        ),
      ],
    );
  }
}
