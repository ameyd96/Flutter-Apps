import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> signup(String email, String password) async {
    //firebase auth rest api =https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[API_KEY]
    //API_KEy = firebase =>project setting=> webAPiKey
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA2eCsgXFvtbC995Gnf4cxSrKVNtsyyO9M');

  final response= await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }
}
