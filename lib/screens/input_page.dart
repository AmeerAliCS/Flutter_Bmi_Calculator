import 'package:calculator_bmi/calculator_brain.dart';
import 'package:calculator_bmi/constants.dart';
import 'package:calculator_bmi/screens/results_page.dart';
import 'package:calculator_bmi/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import 'package:calculator_bmi/components/icon_content.dart';

enum Gender {male , female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      colour: selectedGender == Gender.male ? kActiveCardColour : kInActiveColour,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                        colour: selectedGender == Gender.female ? kActiveCardColour : kInActiveColour),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('HEiGHT' , style: kLabelTextStyle,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(height.toString() , style: kNumberTextStyle,),
                          Text('CM' , style: kLabelTextStyle,)
                        ],
                      ),

                    Slider(
                      value: height.toDouble(),
                      inactiveColor: Color(0xFF8D8E98),
                      activeColor: Color(0xFFEB1555),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (val) {
                        setState(() {
                          height = val.round();
                        });
                      },
                    ),

//                      SliderTheme(
//                        data: SliderTheme.of(context).copyWith(
//                          activeTrackColor: Colors.white,
//                          inactiveTrackColor: Color(0xFF8D8E98),
//                          thumbColor: Color(0xFFEB1555),
//                          overlayColor: Color(0x29EB1555),
//                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
//                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
//                        ),
//                        child: Slider(
//                          value: height.toDouble(),
//                          inactiveColor: Color(0xFF8D8E98),
//                          activeColor: Color(0xFFEB1555),
//                          min: 120.0,
//                          max: 220.0,
//                          onChanged: (val){
//                            setState(() {
//                              height = val.round();
//                            });
//                          },
//                        ),
//                      )


                    ],
                  ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT' , style: kLabelTextStyle,),
                            Text(weight.toString() , style: kNumberTextStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),

                                SizedBox(width: 10.0,),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('AGE' , style: kLabelTextStyle,),
                            Text(age.toString() , style: kNumberTextStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),

                                SizedBox(width: 10.0,),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: (){
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  interpretation: calc.getInterpretaion(),
                  resultText: calc.getResult(),
                )));
              },
            ),
          ],
        ));
  }
}


class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function onPressed;
  RoundIconButton({@required this.icon , @required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0
      ),
      elevation: 6.0,
      onPressed: onPressed,
    );
  }
}


