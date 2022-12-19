import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pet_shop_app/pages/home_page.dart';
import 'package:pet_shop_app/testapi/datauser.dart';
import 'package:pet_shop_app/testapi/global.dart';
import 'package:pet_shop_app/testapi/modelApi/login.dart';
import 'package:http/http.dart' as http;
import 'package:pet_shop_app/testapi/modelApi/message.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isShowpass = true;
  TextEditingController _textEmail = new TextEditingController();
  TextEditingController _textPass = new TextEditingController();
  var _textEmailErr = 'Tài khoản không hợp lệ';
  var _textPassErr = 'Mật khẩu không hợp lệ';
  bool _emailValid = false;
  bool _passValid = false;
  bool checkLogin = false;
  late Login login;
  @override
  void initState() {
    _emailValid = false;
    _passValid = false;
    checkLogin = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.orange.shade900,
              Colors.orange.shade800,
              Colors.orange.shade400
            ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Welcome Shop Cat!',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(66, 88, 22, 0),
                                      blurRadius: 20,
                                      offset: Offset(0, 10)),
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextField(
                                    controller: _textEmail,
                                    decoration: InputDecoration(
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        errorText:
                                            _emailValid ? _textEmailErr : '',
                                        labelText: 'EMAIL',
                                        border: InputBorder.none),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: Stack(
                                    alignment: AlignmentDirectional.centerEnd,
                                    children: [
                                      TextField(
                                        obscureText: _isShowpass,
                                        controller: _textPass,
                                        decoration: InputDecoration(
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            errorText:
                                                _passValid ? _textPassErr : '',
                                            labelText: 'PASSWORD',
                                            border: InputBorder.none),
                                      ),
                                      GestureDetector(
                                        onTap: showPass,
                                        child: _isShowpass
                                            ? Icon(Icons
                                                .no_encryption_gmailerrorred)
                                            : Icon(Icons.enhanced_encryption),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Fogot passwords',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Colors.orange.shade500),
                            child: Center(
                              child: GestureDetector(
                                onTap: loginClick,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'or logins',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                child: GestureDetector(
                                  onTap: () {
                                    print('facbool');
                                  },
                                  child: Image.asset(
                                    'assets/category/facebook.png',
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: GestureDetector(
                                  onTap: () {},
                                  child:
                                      Image.asset('assets/category/google.png'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  void showPass() {
    setState(() {
      _isShowpass = !_isShowpass;
    });
  }

  void loginClick() {
    setState(() {
      //   if(_emailValid && _passValid){
      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text("Nhập tt tk, mk"),
      // ));
      //   }
      if (_textEmail.text.length < 6
          // || !_textEmail.text.contains('@')
          ) {
        _emailValid = true;
      } else {
        _emailValid = false;
      }
      if (_textPass.text.length < 3) {
        _passValid = true;
      } else {
        _passValid = false;
      }
      if (!_emailValid && !_passValid) {
        loginUser(_textEmail.text, _textPass.text);
      }
    });
  }

  void loginUser(String username, String password) async {
    final bodyCode = '{"username": "$username", "password": "$password"}';
    http.Response reponse = await http.post(Uri.parse(URL_NAME + '/login'),
        body: jsonDecode(bodyCode));
    if (reponse.statusCode == 200) {
      var mapReponse = jsonDecode(reponse.body);
      Msg mapMsg = Msg.fromJson(mapReponse['msg']);
      // Msg msg = mapReponse.map((user) => Msg.fromJson(user));
      if (mapMsg.message == ('Dang nhap thanh cong')) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Sai ten tk or mk"),
        ));
      }
      // return Login.fromJsonMsg(mapReponse);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Loi server"),
      ));
    }
  }
}
