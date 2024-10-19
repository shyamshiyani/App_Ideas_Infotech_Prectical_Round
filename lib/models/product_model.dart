import 'dart:convert';

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String categoryName;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.categoryName,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'],
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      brand: json['brand'],
      categoryName: json['categoryName'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images']),
    );
  }
}

class Category {
  final String categoryName;
  final List<Product> categoryProducts;

  Category({
    required this.categoryName,
    required this.categoryProducts,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var productsJson = json['categoryProducts'] as List;
    List<Product> productsList =
        productsJson.map((i) => Product.fromJson(i)).toList();

    return Category(
      categoryName: json['categoryName'],
      categoryProducts: productsList,
    );
  }
}
