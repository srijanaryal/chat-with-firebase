import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future egisterUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // call our database to store data

        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  //login

  //register

  //signout
}
