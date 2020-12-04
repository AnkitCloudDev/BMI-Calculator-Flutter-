import 'package:bmi_calculator/Icon_Contect.dart';
import 'package:bmi_calculator/input_page.dart';

import 'package:flutter/material.dart';

    class ResultsPage extends StatelessWidget {
      final String bmiResult,interPretation,resultText;

      @override
      Widget build(BuildContext context) {
        final normal = TextStyle(
            color: Colors.green, fontSize: 22.0, fontWeight: FontWeight.bold);
        final BMI = TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold,);
        return Scaffold(
          appBar: AppBar(
            title: Text("BMI CALCULATOR"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(child: Container(child: Center(
                child: Text(
                  "Your Result",
                  style: TextStyle(
                    fontSize: 40.0
                  ),
                ),
              ),)
              ),
              Expanded(flex: 5,
              child: buildContainer(
                c: activeCardColor,
                column: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                   Text(interPretation.toUpperCase(),
                       textAlign: TextAlign.center,
                   style: normal),
                    Text(bmiResult
                    ,
                      textAlign: TextAlign.center,
                    style: BMI,),
                    Text(resultText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,

                    ),),BuildGesture(s:"Re-Calculate", onTap: (){
                      Navigator.pop(context);
                    },)
                  ],
                )
              ),)
            ],
          ),
        );
      }

      ResultsPage({@ required this.bmiResult,@required this.interPretation,@required this.resultText});
}
