import 'package:admin/domain/myuser.dart';
import 'package:admin/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key? key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email = "";
  String _password = "";
  bool showLogin = true;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
          padding: EdgeInsets.only(top: 100),
          child: Container(
              child: Align(
                  child: Text("ADMIN",
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)))));
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obscure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white30),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54, width: 1)),
              prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: IconTheme(
                      data: IconThemeData(color: Colors.white), child: icon))),
        ),
      );
    }

    Widget _button(String text, void func()) {
      return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor,
        color: Colors.white,
        child: Text(text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 20)),
        onPressed: () {
          func();
        },
      );
    }

    Widget _form(String label, void func()) {
      return Container(
          child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child:
                  _input(Icon(Icons.email), "EMAIL", _emailController, false)),
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _input(
                  Icon(Icons.lock), "PASSWORD", _passwordController, true)),
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: _button(label, func)))
        ],
      ));
    }

    void _loginButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      MyUser? user = await _authService.signInWithEmainAndPasswordo(
          _email.trim(), _password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: "Can't signIn you! Please check your email/password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            _logo(),
            _form("Login", _loginButtonAction),
          ],
        ));
  }
}
