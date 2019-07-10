import 'package:flutter/material.dart';

class LayoutScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'layout Scaffold',
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
  // 构造
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
        title:Text('layout Scaffold',)
      ),
      body:Center(
        child: Text(pageText),
      ),
      // endDrawer 右边滑出，appBar 上有icon, drawer 左边滑出，需要自己加 icon
//      endDrawer: Drawer(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerItem(57529, 0xFF00BCB6, '合同管理'),
            DrawerItem(57955, 0xFFFBC015, '资金管理'),
            DrawerItem(59471, 0xFFB043F7, '我的授信'),
            DrawerItem(58727, 0xFF557FDC, '收货地址'),
            DrawerItem(57670, 0xFF508EEF, '我的关注'),
            DrawerItem(57958, 0xFF5CD7A4, '消息中心'),
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

class HeardImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack();
  }
}

class DrawerItem extends StatelessWidget {
  final int iconCode;
  final int colorCode;
  final String name;
  // 构造
  DrawerItem(this.iconCode, this.colorCode, this.name,);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 42.0,
      child: FlatButton(
        onPressed: () {
          debugPrint('$name pressed.');
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(IconData(iconCode, fontFamily: 'MaterialIcons'), color: Color(colorCode),),
            Text(' $name'),
          ],
        )
      ),
    );
  }
}

//void main() => runApp(LayoutScaffold());