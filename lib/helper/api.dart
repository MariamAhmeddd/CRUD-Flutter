import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Api {

  Future<dynamic> get({required String url}) async {
    Map<String, String>headers = {};
    headers.addAll({
      'Authorization': 'Bearer 05502afa69b9889c3fef1c85c18579d2e73585cca9d04b06752861224ac01a6f',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    http.Response response = await http.get(Uri.parse(url), headers: headers,);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception('status code ${response.statusCode}');
    }
  }

  //body = name gender email status

  Future<dynamic> post({required String url, @required dynamic body}) async {
    Map<String, String>headers = {};
    headers.addAll({
      'Authorization': 'Bearer 05502afa69b9889c3fef1c85c18579d2e73585cca9d04b06752861224ac01a6f',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    http.Response response = await http.post(
        Uri.parse(url),
        body: body,
        headers: headers
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    }
    else {
      if (response.statusCode == 422) {
        throw Exception(
            "status code ${response.statusCode} : Data validation failed");
      }
      else if (response.statusCode == 500) {
        throw Exception(
            "status code ${response.statusCode} : Internal server error");
      }
      else {
        throw Exception("status code ${response.statusCode}");
      }
    }
  }

  //url&&id

  Future<dynamic> put({required String url, @required dynamic body}) async {
    Map<String, String>headers = {};
    headers.addAll({
      'Authorization': 'Bearer 05502afa69b9889c3fef1c85c18579d2e73585cca9d04b06752861224ac01a6f',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    http.Response response = await http.put(
        Uri.parse(url),
        body: body,
        headers: headers
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      if (response.statusCode == 422) {
        throw Exception(
            "status code ${response.statusCode} : Data validation failed");
      }
      else if (response.statusCode == 500) {
        throw Exception(
            "status code ${response.statusCode} : Internal server error");
      }
      else if (response.statusCode == 304) {
        throw Exception("status code ${response
            .statusCode} : The resource was not modified");
      }
      else {
        throw Exception("status code ${response.statusCode}");
      }
    }
    throw Exception("status code ${response.statusCode}");
  }

  Future<dynamic> delete({required String url}) async {
    Map<String, String>headers = {};
    headers.addAll({
      'Authorization': 'Bearer 05502afa69b9889c3fef1c85c18579d2e73585cca9d04b06752861224ac01a6f',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    http.Response response = await http.delete(
        Uri.parse(url),
        headers: headers
    );
    if (response.statusCode == 204) {
      return null;
    }
    else {
      throw Exception("status code ${response.statusCode}");
    }
  }
}
