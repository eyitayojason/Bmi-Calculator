import 'dart:math';

class BMIBrain {
  BMIBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  double? _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  getResult() {
    if (_bmi! >= 25) {
      return "OverWeight";
    } else if (_bmi! > 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return "You have a higher than normal body weight. Try to Exercise More";
    } else if (_bmi! > 18.5) {
      return "Nice! You Have a normal body weight";
    } else {
      return "You have a lower than normal body weight. Try and eat a bit more";
    }
  }
}
