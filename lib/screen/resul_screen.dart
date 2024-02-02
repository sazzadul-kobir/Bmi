


import 'package:bmi_calculator2/constraint.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'helper/circularBmiIndicator.dart';


class ResultScreen extends StatelessWidget {

  final String bmi;
  final String result;

  const ResultScreen({super.key, required this.bmi, required this.result});



  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue, // Change the status bar color here
    ));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,

        title: Text(
          "Bmi Result",
          style: TextStyle(
            color: Colors.black
          ),

        ),
        leading: NeumorphicButton(
          margin: EdgeInsets.only(left: 5),
          onPressed: (){
            Navigator.of(context).pop();
          },
          padding: EdgeInsets.all(5),
          style: NeumorphicStyle(
            intensity: 1,
            depth: 2,
            color: kbBackgroundcolr,
            boxShape: NeumorphicBoxShape.circle()
          ),
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularBmiIndiator(
              Bmi: bmi,
            ),
            Text(result,
            textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: kTextColor
              ),
              
            )
          ],
        ),
      ),

    );
  }
}
