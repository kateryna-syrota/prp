import 'package:admin/pages/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection('notes');
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    print("//////////////////////");
    firestoreInstance.collection("users").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
    return Text("loading");
  }
}

/*class DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection('notes');
      
     return _usersCollection.snapshots();
   }
}*/
