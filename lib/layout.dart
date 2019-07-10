import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('layout demo'),
        ),
        body: Column(
          children: <Widget>[
            rowTop(),
            Expanded(
              child: rowMain(),
            ),
            rowBtm(),
          ],
        )
      )
    );
  }

  Widget rowTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // 居中显示
      children: <Widget>[
        layoutBtn('三原色按钮', 0xFFf25d8e),
        layoutBtn('三原色按钮', 0xFF25ea84),
        layoutBtn('三原色按钮', 0xFF1e90ff),
      ],
    );
  }

  Widget rowMain() {
    return ListView(
      scrollDirection: Axis.horizontal, // 水平滑动
      children: <Widget>[
        layoutBtn('可滑动按钮', 0xFFf25d8e),
        layoutBtn('可滑动按钮', 0xFF25ea84),
        layoutBtn('可滑动按钮', 0xFF1e90ff),
        layoutBtn('可滑动按钮', 0xFFf25d8e),
        layoutBtn('可滑动按钮', 0xFF25ea84),
      ],
    );
  }

  Widget rowBtm() {
    // 等比例分配多余空间
    return Row(
      children: <Widget>[
        Expanded(
          child: layoutBtn('扩展按钮', 0xFFf25d8e),
        ),
        Expanded(
          child: layoutBtn('扩展按钮', 0xFF25ea84),
        ),
        Expanded(
          child: layoutBtn('扩展按钮', 0xFF1e90ff),
        ),
      ],
    );
  }
}

layoutBtn(text, btnColor) {
  return RaisedButton(
    onPressed: (){},
    color: Color(btnColor),
    textColor: Colors.white,
    padding: EdgeInsets.fromLTRB( 15.0, 0.0, 15.0, 0.0),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 14.0,
      )
    ),
  );
}

//void main() => runApp(Layout());