import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Routes routes = Routes();

  Future<dynamic> pushAndRemoveUntil(Widget widget, BuildContext context) async {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
          (route) => false,
    );
  }
}
