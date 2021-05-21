import 'package:admin/domain/myuser.dart';
import 'package:admin/pages/landing.dart';
import 'package:admin/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AdminApp());
}

class AdminApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return StreamProvider<MyUser?>.value(
      value: AuthService().currentUser,
      initialData: null,
      child: MaterialApp(
        title: "Admin",
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
          textTheme: TextTheme(title: TextStyle(color: Colors.white)),
        ),
        home: LandingPage()
      ),
    );
  }
}