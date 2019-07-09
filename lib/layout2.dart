import 'package:flutter/material.dart';

class Layout2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'layout demo',
      home: new page1(),
    );
  }
}

class page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(title:Text('layout demo')),
      body:Center()
    );
  }
}

//void main () => runApp(navigator());
