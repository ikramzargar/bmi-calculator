import 'package:flutter/material.dart';
import '../constants.dart';

class carddata extends StatelessWidget {
  carddata({@required this.icon, @required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Color(0XFF8D8E98),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: kLabeltextstyle,
        ),
      ],
    );
  }
}
