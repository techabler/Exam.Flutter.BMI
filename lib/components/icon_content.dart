// NOTE : Card box안에 icon 사용자 위젯
import 'package:flutter/material.dart';
import '../constant.dart';

class IconContent extends StatelessWidget {
  IconContent({this.childIcon, this.childTitle});

  final IconData childIcon;
  final String childTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(childIcon, size: kIconSize),
        SizedBox(height: kSizeBoxHeight),
        Text(childTitle, style: kTitleTextStyle)
      ],
    );
  }
}
