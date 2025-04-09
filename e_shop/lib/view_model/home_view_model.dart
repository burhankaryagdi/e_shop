import 'dart:convert';

import 'package:e_shop/model/home_model.dart';
import 'package:http/http.dart' as http;

class HomeViewModel {
  final String url = "https://fakestoreapi.com/products";
  Future<List<HomeModel>> fetchProduct() async {
    Uri uri = Uri.parse(url);
    var res = await http.get(uri);
    if (res.statusCode == 200 || res.statusCode == 201) {
      print("!!!!Status CODE!!!! ${res.statusCode}");
      List<dynamic> jsonBody = jsonDecode(res.body);
      return jsonBody.map((product) => HomeModel.fromJson(product)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
