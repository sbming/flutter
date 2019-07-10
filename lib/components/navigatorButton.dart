import 'package:flutter/material.dart';

navigatorButton (context, str) {
  return RaisedButton(
    padding: const EdgeInsets.all(8.0),
    child:Text(
      str,
      style: TextStyle(
        fontSize: 14.0
      ),
    ),
    onPressed: (){
//      Navigator.push(context, MaterialPageRoute(
//        builder:(context) =>func),
//      );
      Navigator.pushNamed(context, '/$str');
    }
  );
}