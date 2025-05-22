import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/category.dart';

class CategoryService {
  static Future<List<Category>> fetchCategories() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/categories'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Category.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat kategori');
    }
  }
}
