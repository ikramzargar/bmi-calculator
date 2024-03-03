import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/bottom_container.dart';

class resultpage extends StatelessWidget {
  resultpage(
      {@required this.bmivalue,
      @required this.resultadvice,
      @required this.resulttext});
  final String bmivalue;
  final String resulttext;
  final String resultadvice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActivecardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resulttext,
                    style: TextStyle(
                      color: Color(0XFF24D876),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmivalue,
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    resultadvice,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomcontainer(
            ontap: () {
              Navigator.pop(context);
            },
            txt: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
