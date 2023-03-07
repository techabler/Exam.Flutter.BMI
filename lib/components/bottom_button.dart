import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';

// NOTE : No.13.  하단 Button 공통 위젯으로 빼기
class BottomButton extends StatelessWidget {
  BottomButton({this.buttonTitle, this.fnTap});

  final Function fnTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fnTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        color: Color(kBottomContainerColor),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.all(20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
