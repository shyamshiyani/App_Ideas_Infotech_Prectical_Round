import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;

import '../models/product_model.dart';

class FetchDataHelper {
  FetchDataHelper._();
  static final FetchDataHelper fetchDataHelper = FetchDataHelper._();

  Future<List<Category>> fetchCategories() async {
    final jsonString = await rootBundle.rootBundle
        .loadString('assets/app_data/app_products_data.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);

    return jsonResponse
        .map((categoryJson) => Category.fromJson(categoryJson))
        .toList();
  }
}
