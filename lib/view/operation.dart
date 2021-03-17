import 'package:flutter/material.dart';

class OperationView extends StatefulWidget {
  @override
  _OperationViewState createState() => _OperationViewState();
}

class _OperationViewState extends State<OperationView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operation',
      home: OperationPage(),
    );
  }
}

class OperationPage extends StatefulWidget {
  @override
  _OperationPageState createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operation'),
        actions: [TextButton(onPressed: () {}, child: Text('reset'))],
        elevation: 0,
      ),
    );
  }
}
