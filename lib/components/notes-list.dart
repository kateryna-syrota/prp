import 'package:admin/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesList extends StatefulWidget {
  NotesList({Key? key}) : super(key: key);

  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).highlightColor,
        body: StreamBuilder(
          stream: AuthService().getPublicNotes(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                    // valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
              );
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                      //  child: textField(searchController, Icon(Icons.search),
                      //    Color(0x1A008B83), 'Search by title')
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 50, right: 50),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                height: 229,
                                child: Card(
                                    color: Colors.white,
                                    elevation: 2.0,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    child: ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      children: [
                                        Column(
                                          children: [
                                            ListTile(
                                              trailing: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons
                                                    .delete_forever_rounded),
                                                color: Colors.red,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 20, left: 30, right: 30),
                                              child: Text(
                                                  '${snapshot.data!.docs[index]['title']}',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 40, right: 40),
                                              child: Center(
                                                child: Text(
                                                    '${snapshot.data!.docs[index]['description'].toString()}',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 3,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Center(
                                                  child: Text('by nickname12 ',
                                                      maxLines: 3,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                ))
                                          ],
                                        ),
                                      ],
                                    )));
                          }),
                    ),
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ));
  }
}
