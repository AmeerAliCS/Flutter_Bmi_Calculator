import 'dart:math';

class CalculatorBrain{

  final int height;
  final int weight;
  double _bmi;
  CalculatorBrain({this.height, this.weight});

  String calculateBMI(){
     _bmi = weight / pow(height/100, 2);
     return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    } else if(_bmi > 18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getInterpretaion(){
    if(_bmi >= 25){
      return 'You have a higher than normal body weight. try to exercise more.';
    } else if(_bmi > 18.5){
      return 'You have a good body weight. good job!';
    }
    else{
      return 'You have a lower than normal body weight. you can eat a bit more.';
    }
  }

}