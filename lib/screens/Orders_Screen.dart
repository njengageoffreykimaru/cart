import 'package:flutter/material.dart';
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text("Your Orders"),
        centerTitle: true,
      ),
    );
  }
}
