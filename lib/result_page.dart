
import 'input_page.dart';
import 'package:body_mass_index_app/Reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.interpretation, @required this.bmiResults, @required this.resultText});

  final String bmiResults;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Results',
                  style: kLargeText,
                ),
              )
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultText,
                  ),
                  Text(
                    bmiResults,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage() ));
            },
            child: Container(

              child: Center(
                child: Text(
                  'RE-CALCULATE',
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
      ),
    );
  }
}
