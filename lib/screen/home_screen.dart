

import 'package:bmi_calculator2/constraint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Gender selectedGender=Gender.male;

  void whichGender(Gender gender){
    setState(() {
      selectedGender=gender;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
            "BMI Calculator",
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),


      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Gendercard(
                title: "Male",
                isSelected: selectedGender==Gender.male,
                whichgender: ()=>whichGender(Gender.male),
              ),

              Gendercard(
                title: "Female",
                isSelected: selectedGender==Gender.female,
                whichgender: ()=>whichGender(Gender.female),
              )

            ],
          )
        ],
      ),

    );
  }

  GestureDetector Gendercard({
    required Function() whichgender, required title,required isSelected
}) {
    return GestureDetector(
              onTap: whichgender,
              child: Neumorphic(
                style: NeumorphicStyle(
                    intensity: 0.9,
                  depth: 3,
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                  color:isSelected? kActiveColor:null
                ),
                child: Container(
                alignment: Alignment.center,
                  padding: EdgeInsets.all(18),
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Text(title,
                  style: TextStyle(
                    color:isSelected?Colors.white:kTextColor,
                  ),
                  ),
                ),
              ),
            );
  }
}
enum Gender{
 female,
 male,
}