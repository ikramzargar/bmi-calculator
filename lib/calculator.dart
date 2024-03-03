import 'dart:math';

class calculator {
  calculator({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String bmicalculator() {
    _bmi = weight / pow(height / 100, 1);
    return _bmi.toStringAsFixed(1);
  }

  String resulttext() {
    if (_bmi > 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String advice() {
    if (_bmi > 25) {
      return 'Your have a higher body weight. Try exercising!';
    } else if (_bmi > 18.5) {
      return 'Your have a normal body weight. Good job!';
    } else {
      return 'Your have a lower body weight. You should eat more!';
    }
  }
}
