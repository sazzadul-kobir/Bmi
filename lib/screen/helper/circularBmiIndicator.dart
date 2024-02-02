
import 'package:bmi_calculator2/constraint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularBmiIndiator extends StatelessWidget {
  final String Bmi;
  const CircularBmiIndiator({super.key, required this.Bmi});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Neumorphic(
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(),
          intensity: 8,
          depth: 20,
          color: Colors.white
        ),
        child: CircularPercentIndicator(
            radius: 100,
          rotateLinearGradient: true,
          lineWidth: 20,
          percent: 0.8,
          animation: true,
          animationDuration: 1000,
          backgroundColor: Color(0xffededed),
          progressColor: kActiveColor,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text(
            Bmi,
            style: TextStyle(
              fontSize: 45,
              color: kTextColor
            ),
          ),
        ),
      ),
    );
  }
}
