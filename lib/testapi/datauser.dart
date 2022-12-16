import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:pet_shop_app/testapi/modelApi/login.dart';

import 'modelApi/user_model.dart';



class ListUser extends StatelessWidget {
  final List<User> user;
  ListUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user[index].id,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  user[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          onTap: () {},
        );
      },
      itemCount: user.length,
    );
  }
}

class UserScrenn extends StatefulWidget {
  const UserScrenn({super.key});

  @override
  State<UserScrenn> createState() => _UserScrennState();
}

class _UserScrennState extends State<UserScrenn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestAPI'),
      ),
      body: FutureBuilder<dynamic>(
        future: fetchLogin('0866487595','2110'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? TestData(login: (snapshot.data!))
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}


class TestData extends StatelessWidget {
  Login login;
  TestData({Key? key, required this.login}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            login.msg.message,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
