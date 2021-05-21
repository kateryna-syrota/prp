import 'package:admin/domain/myuser.dart';
import 'package:admin/pages/auth.dart';
import 'package:admin/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyUser? user = Provider.of<MyUser?>(context);

    final bool isLogedIn = user != null;

    return isLogedIn ? HomePage() : AuthorizationPage();
  }
}