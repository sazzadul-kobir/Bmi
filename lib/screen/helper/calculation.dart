
import 'dart:math';

class BmiCalculation{

  final double height;
  final int weight;
  double _bmi=0;

  BmiCalculation({required this.height,required this.weight});

  String bmiequation(){
    _bmi =weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result(){
    if(_bmi<18.5){
      return 'your bmi is below the healthy range, you may need to gain weight';
    }else if(_bmi<25){
      return 'your bmi is within the healthy range';
    }else if(_bmi<30){
      return 'your bmi is above the healthy range';
    }else{

      return "your bmi is in the obese range";
    }
  }

}