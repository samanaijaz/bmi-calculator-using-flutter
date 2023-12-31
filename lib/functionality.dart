import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculatedBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if(_bmi>= 25){
      return 'Overweight';
    }
    else if(_bmi > 18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi>= 25){
      return 'Your BMI result is higher than normal body weight, try to exercise more.';
    }
    else if(_bmi > 18.5){
      return 'You have a normal body weight. Good job!';
    }
    else{
      return 'Your BMI result is quite low, you should eat more.';
    }

  }

}