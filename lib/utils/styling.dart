
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///TextStyling
TextStyle myTextStyle12({FontWeight myFontweight = FontWeight.bold,Color color = Colors.black}){
  return TextStyle(
    fontSize: 12,
    color: color,
    fontWeight: myFontweight,
  );
}
TextStyle myTextStyle15({FontWeight myFontweight = FontWeight.bold,Color color = Colors.black}){
  return TextStyle(
    fontSize: 15,
    color: color,
    fontWeight: myFontweight,
    fontFamily: "Antic"
  );
}
TextStyle myTextStyle18({FontWeight myFontweight = FontWeight.normal,Color color = Colors.black}){
  return TextStyle(
    color: color,
      fontSize: 18,
      fontWeight: myFontweight,
      fontFamily: "Antic"
  );
}
TextStyle myTextStyle25({FontWeight myFontweight = FontWeight.normal,Color color = Colors.black}){
  return TextStyle(
    color: color,
      fontSize: 25,
      fontWeight: myFontweight,
      fontFamily: "Antic"
  );
}
TextStyle myTextStyle28({FontWeight myFontweight = FontWeight.bold,Color color = Colors.black}){
  return TextStyle(
      fontSize: 28,
      color: color,
      fontWeight: myFontweight,
      fontFamily: "Antic"
  );
}