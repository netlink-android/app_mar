import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:pet_shop_app/testapi/modelApi/login.dart';

import 'modelApi/user_model.dart';

class ListUser extends StatefulWidget {
  final List<User> user;

  ListUser({Key? key, required this.user}) : super(key: key);

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
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
                  widget.user[index].id,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  widget.user[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          onTap: () {},
        );
      },
      itemCount: widget.user.length,
    );
  }
}

class UserScrenn extends StatefulWidget {
  const UserScrenn({super.key});

  @override
  State<UserScrenn> createState() => _UserScrennState();
}

class _UserScrennState extends State<UserScrenn> {
  Future<dynamic>? _futureAlbum;
  late Login login;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestAPI'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
          child: TextField(
            decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                labelText: 'EMAIL',
                border: InputBorder.none),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
          child: TextField(
            decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                labelText: 'PASSWORD',
                border: InputBorder.none),
          ),
        ),
        MaterialButton(
            child: Text('BTNLogin'),
            color: Colors.amber,
            onPressed: () {
              setState(() {
                _futureAlbum = fetchLogin('0866487595', '210');
              });
            })
      ],
    );
  }

  FutureBuilder<dynamic> buildFutureBuilder() {
    return FutureBuilder<dynamic>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        } else if (snapshot.hasData) {
          login = snapshot.data!;
          if (login.msg.message != 'Dang nhap thanh cong') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Sai ten tk or mk"),
            ));
          }
        }
        return CircularProgressIndicator();
      },
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
          login.msg.message == 'Dang nhap thanh cong'
              ? Text(
                  'login thanh cong',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )
              : Text(
                  'login that bai',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
        ],
      ),
    );
  }
}
