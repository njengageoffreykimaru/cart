
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../Models/Product_model.dart';
import '../favouriteScreen/favourite_screen.dart';
import '../provider/app_provider.dart';
class SingleCartItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleCartItem({super.key,required this.singleProduct});

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  int qty=1;
  @override
  void initState() {
    // TODO: implement initState
    qty=widget.singleProduct.qty??1;
    setState(() {

    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 3),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 140,
              color: Colors.red.withOpacity(0.5),
              child: Image.asset(widget.singleProduct.image),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.singleProduct.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        widget.singleProduct.price.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  AppProvider appProvider=Provider.of<AppProvider>(context,listen: false);
                                  appProvider.removeCartProduct(widget.singleProduct);
                                  Fluttertoast.showToast(
                                    msg: "Product removed Successfully.",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );

                                },
                                icon: Icon(Icons.delete),
                              ),
                              Text('Remove'),
                            ],
                          ),
                          SizedBox(width: 6,),

                          CircleAvatar(
                            child: IconButton(

                              onPressed: () {
                                setState(() {
                                  if(qty>=1){
                                    setState(() {
                                      qty--;
                                    });
                                  }

                                });
                              },
                              icon: Icon(Icons.remove),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 6,),
                          Text(qty.toString(),style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold,color: Colors.black),),
                          CircleAvatar(
                            child: IconButton(

                              onPressed: () {
                                setState(() {
                                  qty++;
                                });
                              },
                              icon: Icon(Icons.add),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          // Add your icon button functionality here
                        },
                        icon: Icon(Icons.star),
                        color: Colors.black,
                      ),
                    ],

                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 280,
                        child: ElevatedButton(


                            onPressed: (){

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => FavouriteScreen()),
                                    (route) => false, // This removes all the previous routes
                              );
                            }

                            ,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder()

                            ),
                            child: Text("ADD TO WISHLIST",style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 15,
                                color: Colors.white),)),
                      ),
                    ],

                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
