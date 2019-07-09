import 'package:flutter/material.dart';

navigatorButton (context, str, func) {
  return RaisedButton(
    child:Text(str),
    onPressed: (){
      Navigator.push(context, MaterialPageRoute(
        builder:(context) =>func),
      );
    }
  );
}