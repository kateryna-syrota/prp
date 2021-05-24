import 'package:flutter/material.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Notes"),
          ),
          body: Text("UsersNotes")),
    );
  }
}
