
import 'package:cart/screens/product_details.dart';
import 'package:flutter/material.dart';

import '../Models/Product_model.dart';
import '../widgets/top_titles.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopTitles(toptitle: "Ecommerce", subtitle: ""),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search....',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Row(
                  children: categoriesList.map((e) => Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 13.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          e,
                          fit: BoxFit.cover, // Adjust the fit based on your preference
                        ),
                      ),
                    ),
                  )).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Best Products",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 12,),
        
              GridView.builder(
        shrinkWrap: true,
        
        itemCount: bestProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          mainAxisSpacing: 20,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (ctx, index) {
          ProductModel singleProduct = bestProducts[index];
          return Padding(
            padding: const EdgeInsets.all(8.0), // Add padding to the whole item
            child: Card(
              margin: const EdgeInsets.all(8.0), // Add margin to the whole item
              color: Colors.red.withOpacity(0.6),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      singleProduct.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    singleProduct.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    singleProduct.price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.0), // Adjust the bottom padding as needed
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context)=>ProductDetails(
                                singleProduct: singleProduct)), (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Change the color as needed
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add_shopping_cart),
                          SizedBox(width: 6.0),
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
        
        
                ],
              ),
            ),
          );
        },
              ),
        
        
              ],
        ),
      ),
    );
  }
}

List<String> categoriesList = [
  "assets/images/appplew1.jpg",
  "assets/images/ipho1.jpg",
  "assets/images/lap2.jpg",
  "assets/images/redmiXiaomi.jpg",
  "assets/images/redmiXiaomi.jpg",
  "assets/images/redmiXiaomi.jpg",
];
List<ProductModel> bestProducts=[
  ProductModel(
      image: "assets/images/appplew1.jpg",
      id: "1",
      isFavourite: false,
      name: "Apple watch",
      price: "Ksh 600000",
      description: "Apple Watch: Smart, stylish, fitness companion with advanced technology",
      status: "Pending"),
  ProductModel(
  image: "assets/images/appplew2.jpg",
  id: "2",
  isFavourite: false,
  name: "Apple watch",
  price: "Ksh 600000",
  description: "Apple Watch: Smart, stylish, fitness companion with advanced technology",
  status: "Pending"),
  ProductModel(
      image: "assets/images/lap9.jpg",
      id: "3",
      isFavourite: false,
      name: "MacBook Laptop",
      price: "Ksh 600000",
      description: "15.6 Touch Screen Windows 11 Laptop,"
          "16GB DDR4 512GB SSD,Intel N5095 Quad-core 2.9 GHz,"
          "Fingerprint and Backlit",
      status: "Pending"),
  ProductModel(
      image: "assets/images/ipho1.jpg",
      id: "4",
      isFavourite: false,
      name: "Iphone ",
      price: "Ksh 1600000",
      description: "Apple iPhone 13 Pro (128 GB, Alpine Green) [Locked] + Carrier Subscription",
      status: "Pending"),
  ProductModel(
      image: "assets/images/lap9.jpg",
      id: "3",
      isFavourite: false,
      name: "MacBook Laptop",
      price: "Ksh 600000",
      description: " 15.6 Touch Screen Windows 11 Laptop,"
  "16GB DDR4 512GB SSD,Intel N5095 Quad-core 2.9 GHz,"
      "Fingerprint and Backlit",
      status: "Pending"),
  ProductModel(
      image: "assets/images/ipho1.jpg",
      id: "4",
      isFavourite: false,
      name: "Iphone ",
      price: "Ksh 1600000",
      description: "Apple iPhone 13 Pro (128 GB, Alpine Green) [Locked] + Carrier Subscription",
      status: "Pending"),
  ProductModel(
      image: "assets/images/phonesamsung.jpg",
      id: "5",
      isFavourite: false,
      name: "Samsung Galaxy",
      price: "Ksh 1600000",
      description: "Samsung Galaxy 13 Pro (128 GB, Alpine Green) [Locked] + Carrier Subscription",
      status: "Pending"),
  ProductModel(
      image: "assets/images/lap8.jpg",
      id: "6",
      isFavourite: false,
      name: "HP LAPTOP  ",
      price: "Ksh 1600000",
      description: " 15.6 Touch Screen Windows 11 Laptop,"
          "16GB DDR4 512GB SSD,Intel N5095 Quad-core 2.9 GHz,"
          "Fingerprint and Backlit",
      status: "Pending"),
  ProductModel(
      image: "assets/images/XiamoRedmi.jpg",
      id: "7",
      isFavourite: false,
      name: "Redmi Phone",
      price: "Ksh 1600000",
      description: "RedmiXiamo 13 Pro (128 GB, Alpine Green) [Locked] + Carrier Subscription",
      status: "Pending"),
  ProductModel(
      image: "assets/images/ipho1.jpg",
      id: "8",
      isFavourite: false,
      name: "Iphone ",
      price: "Ksh 1600000",
      description:"Apple iPhone 13 Pro (128 GB, Alpine Green) [Locked] + Carrier Subscription",

      status: "Pending"),
  ProductModel(
      image: "assets/images/lap9.jpg",
      id: "9",
      isFavourite: false,
      name: "MacBook Laptop",
      price: "Ksh 600000",
      description: " 15.6 Touch Screen Windows 11 Laptop,"
          "16GB DDR4 512GB SSD,Intel N5095 Quad-core 2.9 GHz,"
          "Fingerprint and Backlit",
      status: "Pending"),
  ProductModel(
      image: "assets/images/ipho1.jpg",
      id: "10",
      isFavourite: false,
      name: "Iphone ",
      price: "Ksh 1600000",
      description: "Apple Watch: Smart, stylish, fitness companion with advanced technology",
      status: "Pending"),


];