import 'package:firebase_auth/firebase_auth.dart';
import 'package:messaging_app/Database/data.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // register
  Future createUser(String userName, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseManager().createUserData(userName, user.uid);
    } catch (e) {
      print(e.toString());
    }
  }

  //sign in
  Future loginUser(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
    }
  }
}
