import 'dart:convert';
import 'dart:async';


import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pet_shop_app/testapi/global.dart';
import 'package:pet_shop_app/testapi/modelApi/login.dart';
import 'package:pet_shop_app/testapi/modelApi/user_model.dart';

class Msg {
  Msg({
    required this.message,
  });
  late final String message;
  
  Msg.fromJson(Map<String, dynamic> json){
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    return _data;
  }
}



