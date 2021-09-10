import 'package:bmi_calculator/brain.dart';
import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/IconContent.dart';
import 'package:bmi_calculator/ResuableCard.dart';
import 'constants.dart';
import 'brain.dart';
//Widget cardchild;
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

int height=180;
int weight=80;
int age=19;
class _InputPageState extends State<InputPage> {
  Color male=inactive;
  Color female=inactive;
  int weight=80;
  int height=180;
  void update(int k){
    if(k==1){
      if(male==inactive){
        male=active;
        female=inactive;
      }
      else{
        male=inactive;
      }
    }
    else if(k==2){
      if(female==inactive){
        female=active;
        male=inactive;
      }
      else{
        female=inactive;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child:GestureDetector(
                    onTap: (){
                      setState(() {
                        update(1);
                      });
                    },
                    child: ResuableCard(
                    colour:male,
                    cardchild:IconContent(icon:FontAwesomeIcons.mars,label:'MALE'),
                    ),
                  ),
              ),
              Expanded(
                  child:GestureDetector(
                    onTap: (){
                      setState(() {
                        update(2);
                      });
                    },
                    child: ResuableCard(
                    colour:female,
                      cardchild:IconContent(icon:FontAwesomeIcons.venus,label:'FEMALE'),
              ),
                  )),
            ],
          )),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:ResuableCard(
                  colour:active,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT',
                          style:textstyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(),style:bigtext,
                          ),
                          Text('cm',style:textstyle,)
                        ],
                      ),
                    SliderTheme(
                      data:SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius:15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius:30.0),
    ) ,
                      child: Slider(
                          value: height.toDouble(),
                          min:120.0,
                          max:220.0,
                          onChanged: (double newValue){
                            setState(() {
                              height=newValue.round();
                            });
                          }),
                    )
                    ],
                  ),
              ),
              ),
            ],
          )

          ),


          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:ResuableCard(
                  colour:active,
                cardchild: Center(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'WEIGHT',
                          style: textstyle,
                        ),
                      ),
                      Text(
                        weight.toString(),
                        style:bigtext,
                      ),
                      Center(
                        child: Row(
                          children: [
                            RoundButton(icon:FontAwesomeIcons.minus,onPressed: (){
                              setState(() {
                                weight--;
                              });

                            },),
                            SizedBox(width:20.0),
                            RoundButton(icon:FontAwesomeIcons.plus,onPressed: (){
                              setState(() {
                                weight++;
                              });

                            },),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              Expanded(child:ResuableCard(
                colour:active,
                cardchild: Center(
                child: Column(
                children: [

                Text(
    'AGE',
    style: textstyle,
    ),

                Text(
    age.toString(),
    style:bigtext,
    ),

    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Center(
      child: RoundButton(icon:FontAwesomeIcons.minus,onPressed: (){
      setState(() {
      age--;
      });

      },),
    ),
    SizedBox(width:20.0),
    Center(
      child: RoundButton(icon:FontAwesomeIcons.plus,onPressed: (){
      setState(() {
      age++;
      });

      },),
    ),
    ],
    ),
    ],
    ),
    ),
    )
              ),
            ],
          ),
          ),
          calculatebutton(onTap: (){
                        Brain brain=Brain(height:height,weight:weight);
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Results(
                          bmires: brain.getbmi(),
                          resstext: brain.getres(),
                          desc: brain.getdes(),
                        )));},
          buttontitle: 'CALCULATE BMI',
          )
    ],
    ),
    );
    }
  }


class calculatebutton extends StatelessWidget {
 final Function onTap;
 final String buttontitle;

 calculatebutton({this.onTap,this.buttontitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child:Center(child: Text(buttontitle,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)),
        color:Color(0xFFEB1555),
        margin:EdgeInsets.only(top:10.0),
        width:double.infinity,
        height:bottomone,
      ),
    );
  }
}


class RoundButton extends StatelessWidget {

RoundButton ({this.icon,this.onPressed});
final IconData icon;
final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child:Icon(icon),
        onPressed:onPressed,
        elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width:56.0,
        height:56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
        );
  }
}

//floatingActionButton: FloatingActionButton(
//child: Icon(Icons.add),
