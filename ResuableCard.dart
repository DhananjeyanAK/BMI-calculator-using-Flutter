import 'package:flutter/material.dart';
class ResuableCard extends StatelessWidget{
  ResuableCard({@required this.colour,this.cardchild});
  final Color colour;
  // ignore: non_constant_identifier_names
  final Widget cardchild;
  @override
  Widget build (BuildContext context) {

    return Container(
      child:cardchild,
      margin: EdgeInsets.all(15.0),
      width: 200.0,
      height: 170.0,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );

  }
}