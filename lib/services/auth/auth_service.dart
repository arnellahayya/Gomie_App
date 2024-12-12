import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Get the current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Sign in
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase errors
      _handleAuthException(e);
    }
    // Fallback to ensure a return or throw
    throw Exception('Terjadi kesalahan tak terduga saat login.');
  }

  // Sign up
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase errors
      _handleAuthException(e);
    }
    // Fallback to ensure a return or throw
    throw Exception('Terjadi kesalahan tak terduga saat registrasi.');
  }

  // Sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  // Handle FirebaseAuthException
  void _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'wrong-password':
        throw Exception('Password tidak cocok');
      case 'user-not-found':
        throw Exception('Pengguna tidak ditemukan');
      case 'invalid-email':
        throw Exception('Email tidak valid');
      case 'email-already-in-use':
        throw Exception('Email sudah digunakan');
      case 'weak-password':
        throw Exception('Password terlalu lemah');
      default:
        throw Exception('Terjadi kesalahan. Silakan coba lagi.');
    }
  }
}
