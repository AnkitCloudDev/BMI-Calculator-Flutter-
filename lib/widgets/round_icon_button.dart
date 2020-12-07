import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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