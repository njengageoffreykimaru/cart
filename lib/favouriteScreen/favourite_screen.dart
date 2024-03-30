
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';
import '../screens/single_cart_item.dart';
import '../screens/single_favourite.dart';
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
     AppProvider appProvider=Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Favourite Screen"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);

          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        actions: [

        ],
      ),
      body: appProvider.getFavouriteProductList.isEmpty? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Favourite is empty!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 400,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(),

                ),
                child: Text("START SHOPPING",style: TextStyle(color: Colors.black,

                    fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ),
          ],
        ),
      )
          :Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: appProvider.getFavouriteProductList.length,
                itemBuilder: (ctx, index) {
                  return  SingleFavouriteItem(singleProduct: appProvider.getFavouriteProductList[index],);
                },
              ),
            );
          }
      ),
    );
  }
}
