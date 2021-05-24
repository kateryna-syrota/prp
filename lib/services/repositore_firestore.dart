import 'package:admin/services/auth.dart';

class RepositoryFirestore {
  final firestoreProvider = AuthService();

  collectionReference() => firestoreProvider.collectionReference;
}
