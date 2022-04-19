import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin_example/quotes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //where to go
      home: ARQuotes(),
    );
  }
}
