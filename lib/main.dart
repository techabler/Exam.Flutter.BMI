import 'package:bmi_calculator/screen/result_page.dart';
import 'package:flutter/material.dart';
import 'screen/input_page.dart';

void main() => runApp(BMICalculator());

// NOTE : 1. Main dart에서는 테마만 정하자
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),  //NOTE : -TIP- 기본 LIGHT 테마를 DART 테마로 변경
      /* NOTE : -TIP- 사용자 테마 만들기
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
        accentColor: Colors.purple,
      ),
      */
      // NOTE -TIP- Theme copyWith를 이용해서 기존 테마를 커스터마이징 처리
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      // home: InputPage(),
      initialRoute: "/",
      // NOTE : No.14 - Page Route / Navigator
      routes: {
        "/": (context) => InputPage(),
        "/result": (context) => ResultPage(),
      },
    );
  }
}
