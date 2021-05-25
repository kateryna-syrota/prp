import 'package:admin/services/auth.dart';

class RepositoryFirestore {
  final firestoreProvider = AuthService();

  collectionReference() => firestoreProvider.collectionReference;

  logout() => firestoreProvider.logOut();

  getCurrentUser() => firestoreProvider.currentUser;

  getUserData(Strinf nickname) => firestoreProvider.getUserData(nickname);

  deleteNotes() => firestoreProvider.deleteNotes();
}
