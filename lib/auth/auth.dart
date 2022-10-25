import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentuser => _firebaseAuth.currentUser;
  Stream<User?> get authstatechange => _firebaseAuth.authStateChanges();

  Future<void> singinwithEmailandPassword(
      {required String password, required String email}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> currentuserEmailAndPassword(
      {required String password, required String email}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> sentrequestPasswordEmail({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(
      email: email,
    );
  }

  Future<void> singOut() async {
    await _firebaseAuth.signOut();
  }
}
