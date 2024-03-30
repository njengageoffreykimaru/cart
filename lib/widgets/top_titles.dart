import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String toptitle;
  final String subtitle;

  const TopTitles({Key? key, required this.toptitle, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          toptitle,
          style: TextStyle(),
        ),
        SizedBox(height: 10,),
        Text(
          subtitle,
          style: TextStyle(),
        ),
      ],
    );
  }
}
