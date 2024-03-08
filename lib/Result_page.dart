import 'package:bmi_calculator/Reuseable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Bottombutton.dart';

class ResultsPage extends StatelessWidget {

  final String bmiresult;
  final String bmiresultinfo;
  final String bmiresultmeaning;

  const ResultsPage({super.key, required this.bmiresult, required this.bmiresultinfo, required this.bmiresultmeaning});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: const Text('Your Result',
                style: TextStyle(
                    fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reuseablecard(
              inputcolour: kActivecountainercolour,
              cardchild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 70, 0, 40),
                    child: Text(bmiresultmeaning,
                      style: const TextStyle(
                          color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Text(bmiresult,
                      style: const TextStyle(
                          fontSize: 100, fontWeight: FontWeight.w900, color: Colors.white),
                    ),
                  ),
                  const Text('Normal BMI range:', style: TextStyle(fontSize: 21, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('18.5 - 25 kg/m2', style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(bmiresultinfo,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          BottomButton( // this is an extracted widget
              ontapinput: (){
                Navigator.pop(context);
              },
              textinput: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
