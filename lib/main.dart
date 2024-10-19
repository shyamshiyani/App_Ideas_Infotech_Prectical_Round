import 'package:flutter/material.dart';
import 'package:practical_round/view/screens/cart_screen.dart';
import 'package:practical_round/view/screens/home_screen.dart';
import 'package:practical_round/view/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

import 'controller/cart_provider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => HomeScreen(),
      "product_detail_screen": (context) => const ProductDetailScreen(),
      "cart_screen": (context) => CartScreen(),
    },
  ));
}
