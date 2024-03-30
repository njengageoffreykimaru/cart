import 'package:flutter/material.dart';
class PrimaryButton extends StatelessWidget {
  final void Function() ? onPressed;
  final String title;
  const PrimaryButton({super.key,required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(onPressed: (){

      }, child: Text(title)),
    );
  }
}
