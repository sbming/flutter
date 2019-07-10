import 'package:flutter/material.dart';

class Layout2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'layout demo',
      home: new LayoutFulWidge(),
    );
  }
}

class LayoutFulWidge extends StatefulWidget{
 @override
 layoutDrawer createState() => layoutDrawer();
}

class layoutDrawer extends State{
  @override
  var _currentIndex = 1;
  var pageText = '这是联系人页面';
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        leading: Builder(
          // 必须加 Builder 不然 press 无法识别 Scaffold 或者 去声明 Scaffold GlobalKey<ScaffoldState>()
          builder: (context) => IconButton(
            icon: Icon(Icons.list),
            alignment: Alignment.centerLeft,
            onPressed: () => Scaffold.of(context).openDrawer(),
          )
        ),
        title:Text('layout demo',)
      ),
      body:Center(
        child: Text(pageText),
      ),
      // endDrawer 右边滑出，appBar 上有icon, drawer 左边滑出，需要自己加 icon
//      endDrawer: Drawer(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerItem(1, '列表1'),
            DrawerItem(2, '列表2'),
            DrawerItem(3, '列表3'),
            DrawerItem(4, '列表4'),
            DrawerItem(5, '列表5')
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.account_balance), title: Text('银行'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.contacts), title: Text('联系人'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.library_music), title: Text('音乐')
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            switch (index) {
              case 0: pageText = '这是银行页面'; break;
              case 1: pageText = '这是联系人页面'; break;
              case 2: pageText = '这是音乐页面'; break;
            }
          });
        },
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final int id;
  final String name;
  // 构造
  DrawerItem(this.id, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 52.0,
      child: FlatButton(
        onPressed: () => debugPrint('$name pressed.'),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Text('$id-$name'),],
        )
      ),
    );
  }
}
