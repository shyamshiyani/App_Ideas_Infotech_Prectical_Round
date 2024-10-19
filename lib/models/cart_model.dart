import 'package:flutter/material.dart';

class CartItem {
  final String productId;
  final String title;
  final double price;
  int quantity;

  CartItem({
    required this.productId,
    required this.title,
    required this.price,
    this.quantity = 1,
  });
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['id'].toString(),
      title: json['name'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}
