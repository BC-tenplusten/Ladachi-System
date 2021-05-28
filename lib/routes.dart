import 'package:flutter/material.dart';
import 'package:ladachi_sys/constants.dart';
import 'package:ladachi_sys/screens/purchaseorder.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case poScreen:
        return MaterialPageRoute(builder: (_) => PurchaseOrder());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('Route not defined ${settings.name}'),
                  ),
                ));
    }
  }
}
