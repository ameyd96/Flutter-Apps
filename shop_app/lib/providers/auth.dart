import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> signup(String email, String password) async {
    //firebase auth rest api =https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[API_KEY]
    //API_KEy = firebase =>project setting=> webAPiKey
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA2eCsgXFvtbC995Gnf4cxSrKVNtsyyO9M');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(
        seconds: int.parse(
          responseData['expiresIn'],
        ),
      ));
      notifyListeners();
    } catch (error) {
      throw error;
    }
    //print(json.decode(response.body));
  }

  Future<void> sigin(String email, String password) async {
    //https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=[API_KEY]

    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA2eCsgXFvtbC995Gnf4cxSrKVNtsyyO9M');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(
        seconds: int.parse(
          responseData['expiresIn'],
        ),
      ));
      notifyListeners();
    } catch (error) {
      throw error;
    }
    //print(json.decode(response.body));
  }
}