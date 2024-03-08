import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class Icontext extends StatelessWidget {

  final IconData inputicon;
  final String inputtext;

  const Icontext({super.key, required this.inputicon, required this.inputtext});



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          inputicon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(inputtext,
          style: kLabeltextstyle,
          ),
      ],
    );
  }
}
//Color(0xFF8D8E98)