
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_Content.dart';
import 'Reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'functionality.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender sgender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: Row(
              children:<Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        sgender = Gender.male;
                      });
                    },
                    colour: sgender == Gender.male ? kActiveColor : kInactiveColor,
                    cardChild: iconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(child: ReusableCard(
                  onPress: () {
                    setState(() {
                      sgender = Gender.female;
                    });
                  },
                  colour: sgender == Gender.female ? kActiveColor : kInactiveColor,
                  cardChild: iconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT',
                      style: kLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8DE98),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13.0),

                        thumbColor: Color(0xFFEB1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        //activeColor: Colors.white,
                        //inactiveColor: Color(0xFF8DE98),
                        onChanged: (double newValue){
                          //print(newValue);
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Row(
              children:<Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),

                            SizedBox(width: 10.0),

                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),

                            SizedBox(width: 10.0),

                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            GestureDetector(
              onTap: (){
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResults: calc.calculatedBMI(),
                      resultText: calc.getResults(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
              child: Container(

                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: kLargeText,
                  ),
                ),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 20.0),

                width: double.infinity,
                height: kBottomHeight,
              ),
            ),
          ],
        )

    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
          icon,
          color: Colors.white
      ),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}





