import 'dart:developer';
import 'package:practical_round/models/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();

  Database? database;

  Future<void> initDB() async {
    String directoryPath = await getDatabasesPath();
    String path = join(directoryPath, "E-Commerce.db");

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String query =
            "CREATE TABLE IF NOT EXISTS cart(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price REAL, quantity INTEGER);";
        await db.execute(query);
      },
    );
  }

  Future<int> insertItem(CartItem item) async {
    if (database == null) {
      await initDB();
    }
    String query = "INSERT INTO cart(name, price, quantity) VALUES(?, ?, ?);";
    List args = [item.title, item.price, item.quantity];
    return await database!.rawInsert(query, args);
  }

  Future<List<CartItem>> fetchAllProducts() async {
    if (database == null) {
      await initDB();
    }
    String query = "SELECT * FROM cart;";
    List<Map<String, dynamic>> data = await database!.rawQuery(query);
    return data.map((e) => CartItem.fromJson(e)).toList();
  }

  Future<int> delete(int id) async {
    if (database == null) {
      await initDB();
    }
    String query = "DELETE FROM cart WHERE id = ?;";
    return await database!.rawDelete(query, [id]);
  }
}
