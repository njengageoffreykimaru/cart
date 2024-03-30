
import 'package:flutter/material.dart';

import '../Models/Product_model.dart';
import '../Models/user_model.dart';

class AppProvider with ChangeNotifier{
  List<ProductModel>_cartProductList=[];
  User_Model? user_model;
  User_Model get getUserInformation=>user_model!;
  void addCartProduct(ProductModel productModel) async{
    _cartProductList.add(productModel);
    notifyListeners();


  }
  void removeCartProduct(ProductModel productModel) async{
    _cartProductList.remove(productModel);
    notifyListeners();


  }
  List<ProductModel> get getCardProductList=>_cartProductList;
  void addFavouriteProduct(ProductModel productModel) async{
    _cartProductList.add(productModel);
    notifyListeners();
  }
  void removeFavouriteProduct(ProductModel productModel) async{
    _cartProductList.remove(productModel);
    notifyListeners();
  }
  double totalPrice() {
    double totalPrice =0;

    for (var value in _cartProductList) {
      double price = double.tryParse(value.price) ?? 0.0;
      int qty = value.qty ?? 0;

      print("Price: $price, Qty: $qty, Subtotal: ${price * qty}");

      totalPrice += price * qty;
    }

    print("Total Price: $totalPrice");
    return totalPrice;
  }


  List<ProductModel> get getFavouriteProductList=>_cartProductList;










}