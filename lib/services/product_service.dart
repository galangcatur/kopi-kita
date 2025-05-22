import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/product.dart';

class ProductService {
  static Future<List<Product>> fetchProducts({String? categoryName}) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List jsonData = json.decode(response.body);
      return jsonData
          .map((json) => Product.fromJson(json))
          .where((product) =>
              categoryName == null ||
              product.category.toLowerCase() == categoryName.toLowerCase())
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
