import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/homepage/src/pages/detail_page.dart';

import 'package:flutter_healthcare_app/homepage/src/widgets/coustom_route.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      case "DetailPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => DetailPage(
                  model: settings.arguments,
                ));
    }
    return null;
  }
}
