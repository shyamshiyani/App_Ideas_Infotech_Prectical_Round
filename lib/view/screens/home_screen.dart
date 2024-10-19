import 'package:flutter/material.dart';

import '../../models/cart_model.dart';
import '../../models/product_model.dart';
import '../../utils/fetch_data.dart';
import '../../utils/helper_class/db_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "cart_screen");
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: FetchDataHelper.fetchDataHelper.fetchCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error:${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              List<Category>? data = snapshot.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, i) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[i].categoryName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              ...data[i].categoryProducts.map((e) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "product_detail_screen",
                                        arguments: e);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 80,
                                    child: Card(
                                      elevation: 3,
                                      child: ListTile(
                                        leading: SizedBox(
                                            height: 35,
                                            width: 35,
                                            child: Image.network(e.thumbnail)),
                                        title: Text(e.title),
                                        subtitle: Text("\$${e.price}"),
                                        trailing: IconButton(
                                            onPressed: () {
                                              CartItem item = CartItem(
                                                  productId: e.categoryName,
                                                  title: e.title,
                                                  price: e.price);
                                              DBHelper.dbHelper
                                                  .insertItem(item);
                                              Navigator.pushNamed(
                                                  context, "cart_screen",
                                                  arguments: data);
                                            },
                                            icon: const Icon(
                                                Icons.shopping_cart)),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList()
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
