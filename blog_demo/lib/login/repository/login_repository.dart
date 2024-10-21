// import 'dart:convert';
// import 'package:blog_demo/login/model/login_response_model.dart';
// import 'package:http/http.dart' as http;
// import '../model/login_request_model.dart';
//
// class LoginRepository {
//   login(String username, String password) async {
//     var url = 'https://dummyjson.com/auth/login';
//
//     LoginRequestModel loginRequestModel =
//         LoginRequestModel(username: username, password: password);
//
//     http.Response response = await http.post(Uri.parse(url),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(loginRequestModel.toJson()));
//
//     if (response.statusCode == 200) {
//       var resp = response.body;
//       var respBody = jsonDecode(resp);
//       return LoginResponseModel.fromJson(respBody);
//     }
//     else {
//       throw Exception('Invalid Credentials');
//     }
//   }
// }
//
// /*
// *
// * fetch('https://dummyjson.com/auth/login', {
//   method: 'POST',
//   headers: { 'Content-Type': 'application/json' },
//   body: JSON.stringify({
//
//     username: 'emilys',
//     password: 'emilyspass',
//     expiresInMins: 30, // optional, defaults to 60
//   }),
//   credentials: 'include' // Include cookies (e.g., accessToken) in the request
// })
// .then(res => res.json())
// .then(console.log);
// *
// * */

import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../model/login_request_model.dart';
import '../model/login_response_model.dart'; // Optional for debug printing

class LoginRepository {
  Future<LoginResponseModel> login(String username, String password) async {
    var url = 'https://dummyjson.com/auth/login';

    LoginRequestModel loginRequestModel =
    LoginRequestModel(username: username, password: password);

    // Create an instance of HttpClient
    HttpClient httpClient = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;

    try {
      // Open the HTTP POST request
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));

      // Set headers
      request.headers.set('Content-Type', 'application/json');

      // Send the request body
      request.add(utf8.encode(jsonEncode(loginRequestModel.toJson())));

      // Wait for the response
      HttpClientResponse response = await request.close();

      // Handle the response
      if (response.statusCode == 200) {
        String responseBody = await response.transform(utf8.decoder).join();
        var respBody = jsonDecode(responseBody);
        return LoginResponseModel.fromJson(respBody);
      } else {
        throw Exception('I');
      }
    } catch (e) {
      // Handle exceptions
      if (kDebugMode) {
        print('Request failed: $e');
      }
      throw Exception('Invalid Credentials');
    } finally {
      // Close the client
      httpClient.close();
    }
  }
}

