import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
const activeCardColor= Color(0xFF111328);
const inactiveCardColor = Color(0xFF1D1E33);
enum Gender{
 male,female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
   Gender selectedGender;
    int height= 180;
    int weight=70;
    int age=25;
  @override
  Widget build(BuildContext context) {

    final style = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(

                  onTap: (){
                    setState(() {
                      selectedGender=selectedGender==Gender.male?null:Gender.male;
                    });
                  },
                  child: buildContainer(
                      c:selectedGender==Gender.male?inactiveCardColor:activeCardColor,
                      column:buildColumn(ic:buildIcon(FontAwesomeIcons.mars),t:buildText("MALE")
                      )
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender=selectedGender==Gender.female?null:Gender.female;
                    });
                  },
                  child: buildContainer(
                      c:selectedGender==Gender.female?inactiveCardColor:activeCardColor,
                      column:
                      buildColumn(ic:buildIcon(FontAwesomeIcons.venus),t:buildText("FEMALE")
                      )
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {

                });
              },
              child: buildContainer(
                  c:inactiveCardColor,
                column:
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center
                   ,children: <Widget>[
                        buildText("HEIGHT"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[

                            Text(height.toString(),
                              style: style,
                            ),
                            Text("cm")
                          ],
                        ),
                        SliderTheme(
                            data: SliderTheme.of(context).copyWith(thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0)), child:
                        Slider(
                          value: height.toDouble(),
                          min: 140.0,max: 240.0,
                          activeColor: Color(0xFFBB1555),
                          inactiveColor: Color(0xFF8D8E98),

                          onChanged: (e){
                            setState(() {
                              height=e.round();
                            });
                          },
                        ))

                      ],
                    )


              ),
            ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              buildExpanded(c:inactiveCardColor,column: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildText("WEIGHT")

                  ,
                  Text(weight.toString(),
                  style: style ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        icon: Icon(FontAwesomeIcons.plus),
                        onPressed: (){
                          setState(() {
                            weight++;
                          });
                        },
                      ),

                      SizedBox(width: 20.0,),
                      RoundIconButton(
                          icon: Icon(FontAwesomeIcons.minus),
                        onPressed: (){
                          setState(() {
                            weight--;
                          });
                        },
                        ),],
                  )
                ],
              )),
              buildExpanded(c:inactiveCardColor,column: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildText("AGE")


                  ,
                  Text(age.toString(),
                    style: style ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        icon: Icon(FontAwesomeIcons.plus),
                        onPressed: (){
                          setState(() {
                            age++;
                          });
                        },
                      ),

                      SizedBox(width: 20.0,),
                      RoundIconButton(
                        icon: Icon(FontAwesomeIcons.minus),
                        onPressed: (){
                          setState(() {
                            age--;
                          });
                        },
                      ),],
                  )
                ],
              )),

            ],
          ))
          ,BuildGesture( onTap: (){
            Calculator calc= Calculator(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(bmiResult: calc.calculateBMI(),resultText: calc.getResult(),interPretation: calc.getInterpretation(),)) );
          },s:"CALCULATE")
        ],
      )

    );
  }

  Expanded buildExpanded({@required Color c, Column column}) {

    return Expanded( child: buildContainer(c:c,column: column),

        );
  }

  Container buildContainer({Color c, Column column,Icon ic, Text t,String s,IconData iconData}) {

    return Container(
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: c,
            ),

        child:
          column
            );
  }

  Column buildColumn({Icon ic, Text t}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        ic,
               SizedBox(
          height: 15.0,
        ),
        t
      ],

    );
  }

  Text buildText(String s) {
    return Text(
        s,
        style: TextStyle(
        fontSize: 18.0,
            color: Color(0xFF8D8E98)
      ),
      );
  }

  Icon buildIcon(IconData iconData) {
    return Icon(
      iconData,
        size: 80.0,
      );
  }
}

class BuildGesture extends StatelessWidget {
  final Function onTap;
  final String s;
  const BuildGesture({
    Key key, @required this.onTap, this.s,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top:10.0),
        width: double.infinity,
        height: 80.0,
        child: Center(

          child: (

          Text(s,
          style:TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,


          ),)
          ),
        ),
      ),
    );
  }
}

class RoundIconButton  extends StatelessWidget {
  final Icon icon;
  final Function onPressed;
  RoundIconButton({this.icon,@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ), onPressed: onPressed,
child: icon ,
    );
  }
}
