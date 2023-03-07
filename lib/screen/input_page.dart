import 'dart:ffi';

import 'package:bmi_calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/screen/result_page.dart';

enum Gender { mail, femail }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

// NOTE : 2. 실제 Main 위젯에서는 전체 Layout을 설정하자.
class _InputPageState extends State<InputPage> {
  // NOTE : No.6 상태 저장 변수를 통해 직접 BG Color를 변경하자.
  Gender selectedGender;
  int mHeight = 180;
  int mWeight = 60;
  int mAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    fnPress: () {
                      setState(() {
                        selectedGender = Gender.mail;
                      });
                    },
                    colour: selectedGender == Gender.mail
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      childIcon: FontAwesomeIcons.mars,
                      childTitle: 'MAIL',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    // Note : No.9 - Function을 Paramenter로 전달한 예시
                    fnPress: () {
                      setState(() {
                        selectedGender = Gender.femail;
                      });
                    },
                    colour: selectedGender == Gender.femail
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      childIcon: FontAwesomeIcons.venus,
                      childTitle: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTitleTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(mHeight.toString(), style: kNmuberTextStyle),
                      Text(
                        'cm',
                        style: kTitleTextStyle,
                      ),
                    ],
                  ),
                  // NOTE : No.10 - Slider Class 커스터마이징 시키기 :
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: kSliderInactiveColor,
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: mHeight.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            mHeight = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTitleTextStyle,
                        ),
                        Text(
                          mWeight.toString(),
                          style: kNmuberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              fnPress: () {
                                setState(() {
                                  mWeight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              fnPress: () {
                                setState(() {
                                  mWeight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTitleTextStyle,
                        ),
                        Text(
                          mAge.toString(),
                          style: kNmuberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              fnPress: () {
                                setState(() {
                                  mAge--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              fnPress: () {
                                setState(() {
                                  mAge++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATOR',
            fnTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: mWeight, height: mHeight);

              // NOTE : No.11 - Page Route with arguments
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                      bmiResult: calc.calculateBMI().toString(),
                      resultText: calc.getResult().toUpperCase(),
                      interpretation: calc.getInterpretation()),
                ),
              );

              // NOTE : No.11 - pushNamed방식에서 args를 전달하기 위해서는 Req/Response 모두 Map<>으로 전달/받아야 함.
              // Navigator.pushNamed(context, '/result', arguments: {
              //   "bmiResult": calc.calculateBMI().toString(),
              //   "resultText": calc.getResult(),
              //   "interpretation": calc.getInterpretation(),
              // });
            },
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
