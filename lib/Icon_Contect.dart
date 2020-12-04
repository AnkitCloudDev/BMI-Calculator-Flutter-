import 'package:flutter/cupertino.dart';

Expanded buildExpanded({@required Color c, Column column}) {

  return Expanded( child: buildContainer(c:c,column: column),

  );
}

Container buildContainer({Color c, Column column}) {

  return Container(
    margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: c,


    ),
    child:
    column,
  );
}

Column buildColumn({Icon ic, Text t}) {
  return Column(
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
