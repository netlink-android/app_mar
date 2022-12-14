import 'dart:convert';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class User {
  String? id;
  String? avt;
  String? name;
  String? email;
  String? password;

  User({this.id, this.avt, this.name, this.email, this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avt = json['avt'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avt'] = this.avt;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

const String url = 'http://localhost:3000/datauser';
// static List<User> parseUser(String ressponse) {
//   var list = json.decode(ressponse) as List<dynamic>;
//   List<User> datauser = list.map((user) => User.fromJson(user)).toList();
//   return datauser;
// }
Future<List<User>> fetchUser(http.Client client) async {
  final reponse = await client.get(Uri.http(url));
  if (reponse.statusCode == 200) {
    Map<String, dynamic> mapReponse = json.decode(reponse.body);
    final datauser = mapReponse[''].cast<Map<String, dynamic>>();
    final datauserr = await datauser.map<User>((json) {
      return User.fromJson(json);
    }).toList();
    return datauserr;
  }else {
    throw Exception('Failed to');
  }
}
