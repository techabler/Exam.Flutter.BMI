import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "OverWeight";
    } else if (_bmi > 18.5 && _bmi < 25) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "Your are OverWeight";
    } else if (_bmi > 18.5 && _bmi < 25) {
      return "Your are Normal";
    } else {
      return "Your are UnderWeight";
    }
  }
}
