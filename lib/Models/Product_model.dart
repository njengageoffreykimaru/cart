import 'dart:convert';
ProductModel productModelFromJson(String str)=>ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data)=>json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.image,
    required this.id,
    required this.isFavourite,
    required this.name,
    required this.price,
    required this.description,
    required this.status,
    this.qty,

  });

  String image;
  String id;
  bool isFavourite;
  String name;


  String price;
  String description;
  String status;
  int ? qty;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    image: json["image"],
    id: json["id"],
    isFavourite: false,
    qty: json["qty"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    status: json["status"],


  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "id": id,
    "isFavourite":isFavourite,
    "qty": qty,
    "name": name,
    "price": price,
    "description":description,
  };
  ProductModel copyWith({
    String? image,
    String? id,
    bool? isFavourite,
    String? name,
    String? price,
    String? description,
    String? status,
    int ? qty,
  }) {
    return ProductModel(
      image: image ?? this.image,
      id: id ?? this.id,
      isFavourite: isFavourite ?? this.isFavourite,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      status: status ?? this.status,
      qty: qty ?? this.qty,
    );
  }
}

// Usage Example:

