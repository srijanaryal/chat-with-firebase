import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  void updateUserData(String fullName, String email) {}

  // implementation here
}

//references for the collection

final CollectionReference userCollection =
    FirebaseFirestore.instance.collection('users');
final CollectionReference groupCollection =
    FirebaseFirestore.instance.collection('groups');
Future<void> updateUserData(String fullName, String email) async {
  String? uid;
  return await userCollection.doc(uid).set({
    "fullName": fullName,
    "email": email,
    "groups": [],
    "profilePic": "",
    "uid": uid,
  });
}
