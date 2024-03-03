import 'package:flutter/material.dart';
import '../constants.dart';

class bottomcontainer extends StatelessWidget {
  bottomcontainer({@required this.ontap, @required this.txt});
  final Function ontap;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(
          bottom: 10,
        ),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        color: kBottomconatainercolor,
        margin: EdgeInsets.only(top: 10),
        height: 80,
        width: double.infinity,
      ),
    );
  }
}
