
import 'dart:math';

class Calculator{
  final int height;
  final int weight;
  double bmi;

  Calculator({this.height, this.weight});
  
  String calculateBMI(){
   double h=height/100;
    bmi=weight/pow(h,2);
   return bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(bmi>=25){
      return "overweight";
    }
    else  if(bmi<18.5){
      return "underweight";
    }
    else{
      return "Normal";
    }
  }

  String getInterpretation(){
    if(bmi>=25){
      return "overweight!! Start Exercising";
    }
    else  if(bmi<18.5){
      return "underweight!! start Eating";
    }
    else{
      return "Normal Weight!! Congratulations";
    }
  }
}