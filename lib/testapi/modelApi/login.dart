import 'dart:convert';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pet_shop_app/testapi/modelApi/message.dart';
import 'package:pet_shop_app/testapi/modelApi/user_model.dart';

import '../global.dart';

class Login {
  late final Msg msg;
  late final User user;
  late final String token;

  Login({required this.msg, required this.user, required this.token});

  Login.fromJson(Map<String, dynamic> json) {
    msg = Msg.fromJson(json['msg']);
    user = User.fromJson(json['user']);
    token = json['token'];
  }
  Login.fromJsonMsg(Map<String, dynamic> json) {
    msg = Msg.fromJson(json['msg']);
  }
}

Future<Login> fetchLogin(String username, String password) async {
  final bodyCode = '{"username": "$username", "password": "$password"}';
  http.Response reponse = await http.post(Uri.parse(URL_NAME + '/login'),
      body: jsonDecode(bodyCode));
  if (reponse.statusCode == 200) {
    var mapReponse = jsonDecode(reponse.body);
    Msg mapMsg = Msg.fromJson(mapReponse['msg']);
    // Msg msg = mapReponse.map((user) => Msg.fromJson(user));
    if (mapMsg.message.toString().compareTo('Dang nhap thanh cong') == true) {
      return Login.fromJson(mapReponse);
    } else {
      return Login.fromJsonMsg(mapReponse);
    }
    // return Login.fromJsonMsg(mapReponse);
  } else {
    throw Exception('Failed to');
  }
}
