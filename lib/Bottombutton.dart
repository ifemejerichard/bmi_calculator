import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {

  final GestureTapCallback ontapinput; // if you ever want to find out the type of a variable, just google or check flutter documentation.
  final String textinput;

  const BottomButton({super.key,  required this.ontapinput, required this.textinput});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapinput,
      child: Container(
        color: kButtomcontainercolour,
        margin: const EdgeInsets.only(top: 5),
        width: double.infinity,
        height: kButtomcontainerheight,
        child: Center(
            child: Text(textinput,
              style: kLabeltextstylecontainer,)
        ),
      ),
    );
  }
}
