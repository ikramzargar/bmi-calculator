import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/card_data.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/RESUT_PAGE.DART.dart';
import 'package:bmi_calculator/components/bottom_container.dart';
import 'package:bmi_calculator/components/round_icon.dart';
import 'package:bmi_calculator/calculator.dart';

enum Gender { Male, Female }

int height = 180;
int weight = 45;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ReusableCard(
                      onpress: () {
                        setState(
                          () {
                            selectedgender = Gender.Male;
                          },
                        );
                      },
                      colour: selectedgender == Gender.Male
                          ? kActivecardcolor
                          : kInactivestatecolor,
                      cardchild: carddata(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onpress: () {
                        setState(
                          () {
                            selectedgender = Gender.Female;
                          },
                        );
                      },
                      colour: selectedgender == Gender.Female
                          ? kActivecardcolor
                          : kInactivestatecolor,
                      cardchild: carddata(
                          icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActivecardcolor,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: kLabeltextstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: kNumberStyle,
                              ),
                              Text(
                                'cm',
                                style: kLabeltextstyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15,
                              ),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 30,
                              ),
                              thumbColor: Color(0xFFEB1555),
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Colors.white,
                              overlayColor: Color(0x29EB1555),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newvalue) {
                                setState(
                                  () {
                                    height = newvalue.round();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActivecardcolor,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT (kg)',
                            style: kLabeltextstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
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
                      colour: kActivecardcolor,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE (yrs)',
                            style: kLabeltextstyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
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
              ),
            ),
            bottomcontainer(
              ontap: () {
                calculator calc = calculator(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return resultpage(
                        bmivalue: calc.bmicalculator(),
                        resultadvice: calc.advice(),
                        resulttext: calc.resulttext(),
                      );
                    },
                  ),
                );
              },
              txt: 'CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}
