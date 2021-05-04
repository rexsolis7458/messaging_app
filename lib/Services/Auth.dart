import 'package:firebase_auth/firebase_auth.dart';
import 'package:messaging_app/Database/data.dart';
import 'package:messaging_app/user/user.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users _userFromFirebaseUser(User user) {
    return user != null ? Users(userId: user.uid) : null;
  }

  // register

  // Future signUpwithEmailAndPassword(
  //     String userName, String email, String password) async {
  //   try {
  //     AuthResult result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     FirebaseUser user = result.user;
  //     await DatabaseManager().createUserData(userName, user.uid);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future signUpwithEmailAngPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  //sign in
}
