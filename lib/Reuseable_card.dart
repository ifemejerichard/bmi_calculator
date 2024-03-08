import 'package:flutter/material.dart';

class Reuseablecard extends StatelessWidget {

  final Color inputcolour; // this is a property for this class of type Color.
  final Widget? cardchild; // this is a property for this class of type Widget but the question mark added means the property isn't required.

 const Reuseablecard({super.key, required this.inputcolour, this.cardchild}); // this is a constructor that helps this class take in arguments and the argument helps us change its colour.

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: inputcolour, borderRadius: BorderRadius.circular(5)),
          child: cardchild
    );
  }
}