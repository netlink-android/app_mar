import 'dart:convert';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pet_shop_app/testapi/global.dart';

class User {
  String id;
  String avt;
  String name;
  String email;
  String password;

  User(
      {required this.id,
      required this.avt,
      required this.name,
      required this.email,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        avt: json['avt'],
        name: json['name'],
        email: json['email'],
        password: json['password']);
  }
}

// data User
// List<User> parseUser(String response) {
//   var list = json.decode(response) as List<dynamic>;
//   List<User> datauser = list.map((user) => User.fromJson(user)).toList();
//   return datauser;
// }

Future<List<User>> fetchUser(http.Client client) async {
  final reponse = await client.get(Uri.parse(URL_NAME + '/datauser'));
  var list = json.decode(reponse.body) as List<dynamic>;
  if (reponse.statusCode == 200) {
    List<User> datauser = list.map((user) => User.fromJson(user)).toList();
    
    return datauser;
  }else {
    throw Exception('Failed to');
  }
  // if (reponse.statusCode == 200) {
  //   return compute(parseUser, reponse.body);
  // } else if (reponse.statusCode == 404) {
  //   throw Exception('Not Found');
  // } else {
  //   throw Exception('Failed to');
  // }
}

//login

