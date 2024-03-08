import 'package:bmi_calculator/Calculator_brain.dart';
import 'package:bmi_calculator/Result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // this is a package for fonts
import 'package:bmi_calculator/Icon_text.dart';
import 'package:bmi_calculator/Reuseable_card.dart';
import 'package:bmi_calculator/constants.dart';// this contains all our constant variables so we can call them anytime.
import 'package:bmi_calculator/Bottombutton.dart';
import 'package:bmi_calculator/Text_row.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


enum Gender {male, female} // kind of useless in my opinion but make the code more readable (watch the enum video for more info)

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int height = 180; //the value in the middle container
  int weight = 74;
  int age = 19;

  Color malecardcolour = kInactivecontainercolour;
  Color femalecardcolour = kInactivecontainercolour;

  void updatecolour (Gender selectedgender){ // the selectedgender is the variable going into the updatecolour function as its input(the variable is of type gender)
    if(selectedgender == Gender.male) {
      if (malecardcolour == kInactivecontainercolour) {
        malecardcolour = kActivecountainercolour; // this switches on the male card colour
        femalecardcolour = kInactivecontainercolour;// this switches off the female card colour
      }
      else{
        malecardcolour = kInactivecontainercolour;
      }
    }
    if(selectedgender == Gender.female) {
      if (femalecardcolour == kInactivecontainercolour) {
        femalecardcolour = kActivecountainercolour; // this switches on the female card colour
        malecardcolour = kInactivecontainercolour; // this switches off the male card colour
      }
      else{
        femalecardcolour = kInactivecontainercolour;
      }
    }
  }
  //There is also another way of implementing this is/else statement using the ternary operator (syntactic sugar)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.4, title: const Text('BMI CALCULATOR'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          updatecolour(Gender.male);
                        });
                      },
                      child: Reuseablecard( // this is a custom widget we created containing a container which takes two arguments(a colour & a widget )
                        inputcolour: malecardcolour, // this is the input colour
                        cardchild: const Icontext( // this is a widget that we created that accepts a two properties
                            inputicon: FontAwesomeIcons.mars,
                            inputtext: 'MALE'),
                      ),
                    ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updatecolour(Gender.female);
                      });
                    },
                    child: Reuseablecard(// this is a custom widget we created containing a container which takes two arguments(a colour & a widget )
                      inputcolour: femalecardcolour,
                      cardchild: const Icontext( // this is a custom widget we created containing a column which takes two arguments(an icon & a text)
                        inputicon: FontAwesomeIcons.venus,
                        inputtext: 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reuseablecard( // this is a custom widget we created containing a container which takes two arguments(a colour & a widget )
              inputcolour: kActivecountainercolour,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('HEIGHT', style: kLabeltextstyle),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic, // this keeps the 173 & cm on the same line.
                    children: <Widget>[
                      Text(height.toString(), // this toString function converts the height which is an int into a string
                           style: kNumbertextstyle),
                      const Text('cm', style: kLabeltextstyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData().copyWith(// the copywith means give us a default slider theme but also give us the ability to tweak what ever we want.
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                        elevation: 5,
                      ),
                      thumbColor: kButtomcontainercolour,
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: const Color(0x24EB1555),
                      trackHeight: 1,
                    ),
                    child: Slider(value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue){
                           setState(() {
                             height = newValue.round();
                           });
                        }
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reuseablecard(
                    inputcolour: kActivecountainercolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('WEIGHT', style: kLabeltextstyle,),
                        Textrow(inputnumber: weight, inputtext: 'kg'),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[ 
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                backgroundColor: MaterialStateProperty.all(const Color(0xFF1D1E33)),
                                padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                              ),
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(FontAwesomeIcons.plus,
                                  size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                backgroundColor: MaterialStateProperty.all(const Color(0xFF1D1E33)),
                                padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                              ),
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              child: const Icon(FontAwesomeIcons.minus,
                                  size: 40
                              ),
                            ),
                          ],
                        ),
                      ],  
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseablecard(
                    inputcolour: kActivecountainercolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('AGE', style: kLabeltextstyle,),
                        Textrow(inputnumber: age, inputtext: 'yr'),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                backgroundColor: MaterialStateProperty.all(const Color(0xFF1D1E33)),
                                padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                              ),
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(FontAwesomeIcons.plus,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                backgroundColor: MaterialStateProperty.all(const Color(0xFF1D1E33)),
                                padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                              ),
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Icon(FontAwesomeIcons.minus,
                                  size: 40
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              ontapinput: (){
                if(malecardcolour == kInactivecontainercolour && femalecardcolour == kInactivecontainercolour){
                  Alert(context: context, title: "TRY AGAIN", desc: "You did not select your gender",
                      style: const AlertStyle(backgroundColor: Colors.black87,
                          isButtonVisible: false, titleStyle: kLabeltextstylecontainer,
                          descStyle: kLabeltextstylecontainer)
                  ).show();
                  return;
                }
                if(weight < 20 || age < 5){
                  Alert(context: context, title: "TRY AGAIN", desc: "weight and age are too low!",
                      style: const AlertStyle(backgroundColor: Colors.black87,
                          isButtonVisible: false, titleStyle: kLabeltextstylecontainer,
                          descStyle: kLabeltextstylecontainer)
                  ).show();
                  return;
                }
                CalculatorBrain calc = CalculatorBrain(heightinput: height, weightinput: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ResultsPage(
                      bmiresult: calc.calculateBmi(),
                      bmiresultinfo: calc.resultInfo(),
                      bmiresultmeaning: calc.resultmeaning()
                  );
                }),
                );
              },
              textinput: 'CALCULATE YOUR BMI'),
        ],
      ),
    );
  }
}