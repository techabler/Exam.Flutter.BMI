import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../components/reuseable_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('Your Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Text(
            'Your Result',
            style: kResultTopTitleTextStyle,
            textAlign: TextAlign.center,
          )),
          Expanded(
            flex: 8,
            child: ReuseableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: kResultTileTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kNmuberTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kResultDescriptionTextStyle,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              buttonTitle: 'Re-Calculator',
              fnTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
