import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARQuotes extends StatefulWidget {
  @override
  _ARQuotesState createState() => _ARQuotesState();
}

class _ARQuotesState extends State<ARQuotes> {
  ArCoreController arCoreController;

  void whenArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = controlOnPlaneTap;
  }

  controlOnPlaneTap(List<ArCoreHitTestResult> results) {
    final hit = results.first;

    addQuotedImage(hit);
  }

  Future addQuotedImage(ArCoreHitTestResult hitTestResult) async {
    final bytes =
        (await rootBundle.load("assets/MentalHealth.png")).buffer.asUint8List();

    final imageQuote = ArCoreNode(
      image: ArCoreImage(bytes: bytes, width: 600, height: 600),
      position: hitTestResult.pose.translation + vector.Vector3(0.0, 0.0, 0.0),
      rotation:
          hitTestResult.pose.rotation + vector.Vector4(0.0, 0.0, 0.0, 0.0),
    );

    arCoreController.addArCoreNodeWithAnchor(imageQuote);
  }

  @override
  void dispose() {
    super.dispose();
    arCoreController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mental Health Quotes"),
      ),
      body: ArCoreView(
        onArCoreViewCreated: whenArCoreViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }
}
