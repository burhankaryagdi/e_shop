import 'dart:convert';

import 'package:e_shop/model/login_model.dart';
import 'package:e_shop/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<LoginModel?> login(BuildContext context) async {
    var url = Uri.parse("https://api.escuelajs.co/api/v1/auth/login");
    var res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": emailController.text,
        "password": passwordController.text,
      }),
    );

    if (res.statusCode == 200 || res.statusCode == 201) {
      var jsonBody = jsonDecode(res.body);
      String token = jsonBody["access_token"];

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeView(token: token)),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Geçersiz Şifre veya Mail!")));
    }
    return null;
  }
}
