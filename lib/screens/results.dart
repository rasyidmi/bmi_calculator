import 'file:///D:/LATIHAN_NGODING/FLUTTER/bmi_calculator/lib/components/bottom_button.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ResultsPage extends StatelessWidget {
  final String resultNumber;
  final String resultTitle;
  final String resultDesc;

  ResultsPage(
      {@required this.resultNumber,
      @required this.resultTitle,
      @required this.resultDesc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: TextStyle(
                  color: kCardIconColor,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultTitle,
                    style: kBMIResultStyling,
                  ),
                  Text(
                    resultNumber,
                    style: kBMINumberStyling,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      resultDesc,
                      style: kBMIDescStyling,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: kActiveCardColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              buttonText: 'RE-CALCULATE',
              buttonFunction: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
