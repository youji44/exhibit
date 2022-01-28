import 'dart:convert';
import 'package:exhibit/const.dart';
import 'package:flutter/material.dart';
import 'exhibit_model.dart';
import 'package:http/http.dart' as http;

abstract class ExhibitsLoader {
  Future<List<Exhibit>> getExhibitList();
}

class RestExhibitsLoader implements ExhibitsLoader {
  @override
  Future<List<Exhibit>> getExhibitList() async {
    try {
      final http.Response response =
          await http.get(Uri.parse(BASE_URL + API.LIST));
      List<dynamic> datas = jsonDecode(response.body);
      return Exhibit.fromJsonList(datas);
    } catch (e) {
      throw const Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(child: Text('Connection Error')),
      );
    }
  }
}
