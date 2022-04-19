import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/ar/quotes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //where to go
      home: ARQuotes(),
    );
  }
}
