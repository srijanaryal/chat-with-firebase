import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService(this.uid);

  //references for the collection

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection('groups');
  Future updateUserData(String fullName, String email) async {}
}
