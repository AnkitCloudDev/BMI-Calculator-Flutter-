import 'package:flutter/cupertino.dart';

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