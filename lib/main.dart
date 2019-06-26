import 'package:flutter/material.dart';

import 'components/navigatorButton.dart';
import 'initProject.dart';
import 'example01.dart';
import 'layout.dart';

void main(){
  runApp(MaterialApp(
      title:'welcome to flutter',
      home:MyApp()
  ));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text('flutter Demo')),
      body: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            navigatorButton(context, 'initExample', initProject()),
            navigatorButton(context, 'example01', example01()),
            navigatorButton(context, 'layout', layout()),
          ]
        )
      )
    );
  }
}
