
import 'package:cart/provider/app_provider.dart';
import 'package:cart/screens/custom_bottomnavigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async{

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      
        home:CustomBottomNavigation(),
      
      
      
      ),
    );

  }

}


