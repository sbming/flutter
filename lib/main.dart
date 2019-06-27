import 'package:flutter/material.dart';

import 'components/navigatorButton.dart';
import 'initProject.dart';
import 'example01.dart';
import 'layout.dart';
import 'navigator.dart';

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
//        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: buildGrid(context),
      )
    );
  }
  Widget buildGrid(context) {
    return new GridView.extent(
      maxCrossAxisExtent: 130.0,
      padding: const EdgeInsets.all(4.0),
      children:[
        navigatorButton(context, 'initExample', InitProject()),
        navigatorButton(context, 'example01', Example01()),
        navigatorButton(context, 'layout', Layout()),
        navigatorButton(context, 'navigator', NavigatorTest()),
      ],
    );
  }
}
