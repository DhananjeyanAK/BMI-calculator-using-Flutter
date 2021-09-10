import 'package:bmi_calculator/ResuableCard.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';


class Results extends StatelessWidget {
  final String bmires;
  final String resstext;
  final String desc;

  Results({this.bmires,this.resstext,this.desc});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('BMI CALCULATOR')),
       body:Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children:<Widget> [
           
           Expanded(
             child: Container(
               padding: EdgeInsets.all(15.0),
                   alignment: Alignment.bottomLeft,
                   child:Text('Your results',style:restext,),
                 ),
           ),

           Expanded(
             flex: 5,
               child:ResuableCard(
                   colour: active,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(resstext,style: result,),

                        Text(bmires,style: BMI,),

                        Text(desc,style: body,textAlign: TextAlign.center),

                        calculatebutton(onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>InputPage()));},
                          buttontitle: 'RECALCULATE BMI',
                        )
                      ]
                    ),
               ),
           )
         ],
       ),
    );
  }
}
