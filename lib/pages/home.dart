import 'package:admin/pages/users.dart';
import 'package:admin/services/auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text("Admin"),
          leading: Icon(Icons.admin_panel_settings),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: (){
                AuthService _authService = AuthService();
                _authService.logOut();
              },
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.white,
              ),
              label: SizedBox.shrink(),
            )
          ],
        ),
        body: UsersList(),
      ),
    );
  }
}

class UsersList extends StatelessWidget {

  final users = <Users>[
    Users(title:'Test1', author: "Max1", description: "Test1", level: "Begin1"),
    Users(title:'Test2', author: "Max2", description: "Test2", level: "Begin2"),
    Users(title:'Test3', author: "Max3", description: "Test3", level: "Begin3"),
    Users(title:'Test4', author: "Max4", description: "Test4", level: "Begin4"),
    Users(title:'Test5', author: "Max5", description: "Test5", level: "Begin5")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemBuilder: (context, i){
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                child: ListTile(
                    title: Text(users[i].title)
                ),
              ),
            );
          },
          itemCount: users.length,
        ),
      ),
    );
  }
}