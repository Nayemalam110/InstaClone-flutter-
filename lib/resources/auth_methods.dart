import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> singUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
  }) async {
    String res = 'Some error occurred';

    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential.user!.uid);
        await _firebaseFirestore
            .collection('user')
            .doc(userCredential.user!.uid)
            .set({
          'username': username,
          'uid': userCredential.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
        });
        res = "success";
      } else {
        res = 'Fill all the requered';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
