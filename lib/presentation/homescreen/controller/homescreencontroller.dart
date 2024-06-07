import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newfakstore/model/modelapi.dart';

class HomeScreenController with ChangeNotifier {
  List<SampleApiModel> productlist = [];
  fetchData() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body) as List;

      productlist = decodedData
          .map<SampleApiModel>((element) => SampleApiModel.fromJson(element))
          .toList();
      print(productlist[1].category);
      notifyListeners();
    }
  }
}
