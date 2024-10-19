import 'package:flutter/material.dart';
import 'package:practical_round/models/cart_model.dart';
import 'package:practical_round/utils/helper_class/db_helper.dart';
import 'package:provider/provider.dart';
import '../../controller/cart_provider.dart';
import '../../models/product_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: FutureBuilder(
          future: DBHelper.dbHelper.fetchAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("ERROR:${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              List<CartItem> cart = snapshot.data as List<CartItem>;
              return ListView.builder(
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Text("${cart[i].productId}"),
                    title: Text("${cart[i].title}"),
                    subtitle: Text("${cart[i].price}"),
                    trailing: Text("${cart[i].quantity}"),
                  );
                },
                itemCount: cart.length,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: \$00'),
              ElevatedButton(
                onPressed: () {
                  // Navigate to checkout
                },
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
