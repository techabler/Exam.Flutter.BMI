// NOTE : 반복 위젯을 추출 : Extract flutter widget 메뉴 사용
import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({@required this.colour, this.cardChild, this.fnPress}) {}

  final Color colour;
  final Widget cardChild;
  final Function fnPress;

  @override
  Widget build(BuildContext context) {
    // NOTE : No.9 Parameter로 Function를 전달한다. (ex) fnPress
    return GestureDetector(
      onTap: fnPress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}
