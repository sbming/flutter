import 'package:flutter/material.dart';
import 'package:provide/provide.dart'; // 状态管理

class StateMng extends StatelessWidget {
  // The class that contains all the providers. This shouldn't change after being used.
  // In this case, the Counter gets instantiated the first time someone uses
  // it, and lives as a singleton after that.
  final providers = Providers()
    ..provide(Provider.function((context) => Counter(0)));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'state management',
      home: Scaffold(
        appBar: AppBar(
          title: Text('state management'),
        ),
        body: Center(
          child: Container(
            height: 100.0,
            alignment: Alignment.center,
            child: ProviderNode(
              providers: providers,
              child: CounterApp(),
            ),
          )
        )
      )
    );
  }
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentCounter = Provide.value<Counter>(context);
    return Column(children: [
      // Simplest way to retrieve the provided value.
      // Each time the counter changes, this will get rebuilt. This widget
      // requires the value to be a Listenable or a Stream. Otherwise
      Provide<Counter>(
        builder: (context, child, counter) => Text('${counter.value}', style:TextStyle(fontSize: 26.0, color: Colors.lightBlue),),
      ),
      // This widget gets the counter as a stream of changes.
      // The stream is filtered so that this only rebuilds on even numbers.
      StreamBuilder<Counter>(
        initialData: currentCounter,
        stream: Provide.stream<Counter>(context).where((counter) => counter.value % 2 == 0),
        builder: (context, snapshot) => Text('Last even value: ${snapshot.data.value}'),
      ),
      RaisedButton(child: Text('add'), onPressed: currentCounter.increment),
    ]);
  }
}

// A provide widget can rebuild on changes to any class that implements the listenable interface.
//
// Here, we mixin ChangeNotifier so we don't need to manage listeners ourselves.
//
// Extending ValueNotifier<int> would be another simple way to do this.
class Counter with ChangeNotifier {
  int _value;
  int get value => _value;
  Counter(this._value);
  void increment() {
    _value++;
    // 若少了监听则值不会实时显示
    notifyListeners();
  }
}

//void main() => runApp(StateMng());