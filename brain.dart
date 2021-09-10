import 'dart:math';

class Brain{
  int height;
  int weight;
  Brain({this.height,this.weight});

  double _bmi;

  String getbmi(){
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getres(){
    if(_bmi>=25){
      return "OVERWEIGHT";
    }
    else if(_bmi>18.5){
      return "NORMAL";
    }
    else{
      return "UNDERWEIGHT";
    }

  }

  String getdes(){
    if(_bmi>=25){
      return "You are one burger away from bursting";
    }
    else if(_bmi>18.5){
      return "Perfectly balanced.. As it should be";
    }
    else{
      return "Get this kid a burger";
    }

  }
}