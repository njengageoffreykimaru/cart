
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../Models/Product_model.dart';
import '../provider/app_provider.dart';
import 'AddToCart.dart';
import 'BuyProduct.dart';
import 'home.dart';
class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key,required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty=1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(context,);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
                  (route) => false, // This removes all the previous routes
            );// This line will navigate back
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
                    (route) => false, // This removes all the previous routes
              );

            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(widget.singleProduct.image)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.singleProduct.name),
                IconButton(onPressed: (){
                  setState(() {
                    widget.singleProduct.isFavourite=!widget.singleProduct.isFavourite;
                  });
                  if(widget.singleProduct.isFavourite){
                    appProvider.addFavouriteProduct(widget.singleProduct);

                  }
                  else{
                    appProvider.removeFavouriteProduct(widget.singleProduct);

                  }
                }, icon: Icon(appProvider.getFavouriteProductList.contains(widget.singleProduct) ?
                Icons.favorite_border: Icons.favorite_outlined,
                  color: Colors.red,size: 30,))
              ],
            ),
            Text(widget.singleProduct.description),
            SizedBox(height: 10,),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if(qty>=1){
                        setState(() {
                          qty--;
                        });
                      }

                    });
                  },
                  padding: EdgeInsets.zero,
                  icon: CircleAvatar(
                    child: Icon(Icons.remove),
                  ),
                ),

                SizedBox(width: 12.0,),
                Text(qty.toString(),style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,color: Colors.black),),
                SizedBox(width: 12.0,),
                IconButton(
                  onPressed: () {
                    setState(() {
                      qty++;
                    });
                  },
                  padding: EdgeInsets.zero,
                  icon: CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                )

              ],
            ),
            SizedBox(height: 13,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                  width: 210,
                  child: OutlinedButton(onPressed: (){

                    ProductModel productModel=widget.singleProduct.copyWith(qty: qty);
                    appProvider.addCartProduct(productModel);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen()),
                          (route) => false, // This removes all the previous routes
                    );


                    Fluttertoast.showToast(
                      msg: "Product Added Successfully.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );


                  },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder()
                      ),
                      child: Text("ADD TO CART")),
                ),
                SizedBox(width: 24,),
                SizedBox(
                  height: 45,
                    width: 210,
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => BuyPage()),
                            (route) => false, // This removes all the previous routes
                      );

                    },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          backgroundColor: Colors.green
                        ),
                        child: Text("BUY"))),
              ],
            ),
            SizedBox(height: 12.0,)
          ],
        ),
      ),
    );
  }
}
