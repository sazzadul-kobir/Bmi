
import 'package:bmi_calculator2/constraint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ValueSelector extends StatelessWidget {
  final String label;
  final int value;
  final Function() onIncrement;
  final Function() onDecrement;

   ValueSelector({super.key, required this.label, required this.value, required this.onIncrement, required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: MediaQuery.of(context).size.height*0.25,
      child: Neumorphic(
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20))
        ),
        padding: EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(label,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width*0.05,
              color: kTextColor
            ),
            ),
            Text(
              value.toString(),
              style:TextStyle(
                fontSize: 35,
                color: kTextColor
              ) ,
            ),
            Row(
              children: [
                buildNeumorphicButton(
                  function: onIncrement,
                  icon: Icon(Icons.add)
                ),
                buildNeumorphicButton(
                    function: onDecrement,
                    icon: Icon(Icons.remove)
                ),


              ],
            )
          ],
        ),
      ),
    );
  }

  NeumorphicButton buildNeumorphicButton({required Function() function, required Icon icon}) {
    return NeumorphicButton(
                onPressed: function,
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),

                ),
                child: icon,
              );
  }
}
