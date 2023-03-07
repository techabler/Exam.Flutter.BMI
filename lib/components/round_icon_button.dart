import 'package:flutter/material.dart';

// NOTE :  No.12 - 커스텀 버튼 만들기 (RawMaterialButton 사용)
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, this.fnPress});

  final IconData icon;
  final Function fnPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: fnPress,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
