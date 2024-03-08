import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class Textrow extends StatelessWidget {

  final int inputnumber;
  final String inputtext;

  const Textrow({super.key, required this.inputnumber, required this.inputtext});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic, // this keeps the 173 & cm on the same line.
      children: <Widget>[
        Text(inputnumber.toString(), // this toString function converts the height which is an int into a string
            style: kNumbertextstyle),
        Text(inputtext, style: kLabeltextstyle,
        ),
      ],
    );
  }
}