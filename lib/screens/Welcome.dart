
import 'package:flutter/material.dart';

import '../widgets/top_titles.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TopTitles(toptitle: "Amazing goods",subtitle: "Amazing discounts",)
          ],
        ),
      ),
    );
  }
}
