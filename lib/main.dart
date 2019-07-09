import 'package:flutter/material.dart';

import 'components/navigatorButton.dart';
import 'initProject.dart';
import 'example01.dart';
import 'layout.dart';
import 'layout2.dart';

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
        child: buildGrid(context),
      )
    );
  }
  Widget buildGrid(context) {
    return new GridView.count(
      padding: const EdgeInsets.all(10.0),
      mainAxisSpacing: 10.0, // 主轴/此处垂直 方向间距
      crossAxisSpacing: 10.0, // 副轴/此处水平 方向间距
      crossAxisCount: 4, // 每行数量
      children:[
        navigatorButton(context, 'initExample', initProject()),
        navigatorButton(context, 'example01', example01()),
        navigatorButton(context, 'layout', layout()),
        navigatorButton(context, 'navigator', childPage()),
      ],
    );
  }
}

// navigator
class childPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar:AppBar(title:Text('子页面')),
        body:Center(
          child: RaisedButton(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child:Text('和父页面在同一个文件，左上角才出现返回箭头'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        )
    );
  }
}
