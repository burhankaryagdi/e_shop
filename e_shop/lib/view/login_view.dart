import 'package:e_shop/view_model/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel _loginViewModel = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
      title: Text("Login View"),
    );
  }

  _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(controller: _loginViewModel.emailController),
        SizedBox(height: 20),
        TextField(
          controller: _loginViewModel.passwordController,
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          child: Text("Login"),
          onPressed: () {
            _loginViewModel.login(context);
          },
        ),
      ],
    );
  }
}
