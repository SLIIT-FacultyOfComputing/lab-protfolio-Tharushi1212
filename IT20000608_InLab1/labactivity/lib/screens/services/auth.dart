import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //firebase auth object
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in annonymous user
  Future signInAnonymously() async {
    try {
      UserCredential response = await _auth.signInAnonymously();
      //User user = response.user; //error with user
      //return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  // sign up with email and password

  // sign out
}
