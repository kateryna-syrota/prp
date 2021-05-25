import 'package:admin/services/auth.dart';

class RepositoryFirestore {
  final firestoreProvider = AuthService();

  collectionReference() => firestoreProvider.collectionReference;

  logout() => firestoreProvider.logOut();

  getCurrentUser() => firestoreProvider.currentUser;
}
