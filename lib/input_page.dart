import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable_card.dart';
import 'icon_content.dart';
import 'constant.dart';

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
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(kBottomContainerColor),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

/*

Container(
        decoration: BoxDecoration(
          color: Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(15.0),
      ),


 */
