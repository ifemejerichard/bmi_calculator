import 'dart:math';

class CalculatorBrain {

  late int heightinput;
  late int weightinput;
  late double _bmi; //the underscore means it is a private variable and can onlt

  CalculatorBrain ({required this.heightinput, required this.weightinput});

  String calculateBmi() {
    _bmi = weightinput / pow((heightinput/100), 2); // pow function comes with the math library and it raises to the power of what ever number we put in, in this case 2.
    return _bmi.toStringAsFixed(1); // the tostringasfixed function come with the math library and it reduces the decimal place to 1 and converts the double to string.
  }

  String resultInfo(){
    if (_bmi >= 25){
      return 'It looks like you are overweight, you might want to try exercising';
    }
    else if(_bmi > 18.5 ){
      return 'It looks like you are perfectly OK';
    }
    else{
      return 'You are kind of underweight, you should try eating some more';
    }
  }

  String resultmeaning(){
    if (_bmi >= 25){
      return 'Overweight';
    }
    else if(_bmi > 18.5 ){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }
}