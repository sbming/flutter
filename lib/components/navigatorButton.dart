import 'package:flutter/material.dart';

navigatorButton (context, str, func) {
  return Container(
    margin: const EdgeInsets.only(right: 15.0),
    child: RaisedButton(
      child:Text(str),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(
            builder:(context) =>func),
        );
      }
    )
  );
}