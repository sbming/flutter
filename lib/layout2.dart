import 'package:flutter/material.dart';
import 'components/navigatorButton.dart';

class navigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'navigator demo',
      home: new page1(),
    );
  }
}

class page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(title:Text('父页面')),
      body:Center(
        child: navigatorButton(context, '子页面', page2()),
      )
    );
  }
}

class page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(title:Text('子页面')),
      body:Center(
//        child:RaisedButton(
//          child:Text('返回'),
//          onPressed: (){
//            Navigator.pop(context);
//          },
//        )
      )
    );
  }
}

//void main () => runApp(navigator());
