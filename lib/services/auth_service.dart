import 'dart:convert';

import 'package:flutterapp/environments/dev_env.dart';
import 'package:http/http.dart' as http;

abstract class AuthLogic {
  Future<String> login(String email, String password);
  Future<String> logout();
}

class LoginException implements Exception {}

class SimpleLoginLogic extends AuthLogic {
  @override
  Future<String> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));

    if (email != "alex@email.com" || password != "1234") {
      throw LoginException();
    }

    return "soy un token";
  }

  @override
  Future<String> logout() async {
    // TODO: implement logout
    return null;
  }
}

class AuthService extends AuthLogic {
  String url = DEV_ENV['api'] + DEV_ENV['login'];
  var headers = { 'Content-Type': 'application/json',
    'Authorization': 'Bearer '};
  @override
  Future<String> login(String email, String password) async {
    var body = jsonEncode({'email': email, 'password': password});
    var response = await http.post(url, body: body, headers: headers);

    var jsonResponse =  jsonDecode(response.body);
    if (response == null || !jsonResponse['success']) {
      throw LoginException();
    }

    return jsonResponse;
  }

  @override
  Future<String> logout() {
    // TODO: implement logout
    return null;
  }

}