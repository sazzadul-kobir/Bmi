

import 'package:bmi_calculator2/constraint.dart';
import 'package:bmi_calculator2/screen/resul_screen.dart';
import 'package:bmi_calculator2/widgets/value_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'helper/calculation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Gender selectedGender=Gender.male;
  double height=150;
  int age=0;
  int weight=1;

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
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              HeightSlider(context),//height slider

              SizedBox(
                height: MediaQuery.of(context).size.height*0.55,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueSelector(
                        label: 'Weight',
                        value: weight,
                        onIncrement: (){
                          setState(() {
                            if(weight<200){
                              weight++;
                            }
                          });
                        },
                        onDecrement: (){
                          setState(() {
                            if(weight>0){
                              weight--;
                            }
                          });
                        }
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    ValueSelector(
                        label: 'Age',
                        value: age,
                        onIncrement: (){
                          setState(() {
                            if(age<100){
                              age++;
                            }
                          });
                        },
                        onDecrement: (){
                          setState(() {
                            if(age>0){
                              age--;
                            }
                          });
                        }
                    )
                  ],
                ) ,
              )

            ],
          ),
         NeumorphicButton(
           margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),

           padding: EdgeInsets.symmetric(
             horizontal:MediaQuery.of(context).size.width * 0.31 ,
               vertical: 13,
            ),
           style: NeumorphicStyle(
             color: kActiveColor
           ),
           child: Text("Let's Begin",style:TextStyle(
            color: Colors.white,
             fontWeight: FontWeight.bold,
             fontSize: 18
           ),),
           onPressed: (){
             BmiCalculation obj=BmiCalculation(
               height: height,
               weight: weight,
             );
             Navigator
                 .push(context, MaterialPageRoute(builder: (context)=>ResultScreen(
               bmi:obj.bmiequation() , result: obj.result(),)));
           },
         )
        ],
      ),

    );
  }

  Neumorphic HeightSlider(BuildContext context) {
    return Neumorphic(
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.55,
                width: MediaQuery.of(context).size.width*0.36,

                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("Height", style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kTextColor
                    ),),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.50,
                      child: SfSlider.vertical(
                          thumbIcon: NeumorphicIcon(Icons.circle),
                          stepSize: 1,
                          value: height,
                          min:100,
                          max: 230,
                          showTicks: true,
                          showLabels: true,

                          interval: 20,
                          minorTicksPerInterval: 3,
                          enableTooltip: true,

                          tooltipPosition: SliderTooltipPosition.right,
                          activeColor: kActiveColor,

                          onChanged: (value){
                            setState(() {
                              height=value;
                            });
                          }
                      ),
                    )


                  ],
                ),
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

