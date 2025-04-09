import 'package:e_shop/model/home_model.dart';
import 'package:e_shop/view_model/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required String token});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel _homeViewModel = HomeViewModel();
  List<HomeModel> _fetchProduct = [];

  @override
  void initState() {
    super.initState();
    _homeViewModel.fetchProduct().then((value) {
      if (value != null) {
        setState(() {
          _fetchProduct = value;
        });
      } else {
        print("Error: No data found");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Home View"),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
    );
  }

  _buildBody() {
    return ListView.builder(
      itemCount: _fetchProduct.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_fetchProduct[index].title!),
          subtitle: Text(_fetchProduct[index].description!),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(_fetchProduct[index].image!),
          ),
          trailing: Text("\$${_fetchProduct[index].price}"),
        );
      },
    );
  }
}
