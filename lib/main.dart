import 'package:flutter/material.dart';

import 'components/navigatorButton.dart';
import 'initProject.dart';
import 'example01.dart';
import 'layout.dart';

void main(){
  runApp(MaterialApp(
      title:'welcome to flutter',
      home:new MyApp()
  ));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(title:Text('flutter Demo')),
      body: new Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        child:new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            navigatorButton(context, 'initExample', InitProject()),
            navigatorButton(context, 'example01', Example01()),
            navigatorButton(context, 'layout', Layout()),
          ]
        )
      )
    );
  }
}
