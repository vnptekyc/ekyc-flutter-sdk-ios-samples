import 'dart:math';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Thông tin cá nhân'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('com.flutter.devekyc/callsdk');

  Future<void> _openSDKeKYC() async {

    try {
      debugPrint('_incrementCounter');
      String data = await platform.invokeMethod('getInformationCard');
      print("data from SDK =${data}");
    } on PlatformException catch (e) {
      print("data from SDK =${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Start VNPT eKYC'),
        onPressed: () {
          this._openSDKeKYC();
          print('FloatingActionButton clicked');
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
