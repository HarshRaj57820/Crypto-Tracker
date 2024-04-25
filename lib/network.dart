import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Network {
  Network(this.url);

  String url; 

  Future getAPIData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var mapResponse = jsonDecode(response.body);
      return mapResponse;
    } else {
      debugPrint(response.body);
    }
  }
}
