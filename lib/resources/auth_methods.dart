import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_clone/models/user.dart' as model;
import 'package:insta_clone/resources/storage_method.dart';

class AuthMethods {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

// sing up or create a new user
  Future<String> singUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
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

        String photourl =
            await StorageMatheods().updloadImage('profilePics', file, false);
        model.User user = model.User(
          username: username,
          uid: userCredential.user!.uid,
          photoUrl: photourl,
          email: email,
          bio: bio,
          followers: [],
          following: [],
        );

        await _firebaseFirestore
            .collection('user')
            .doc(userCredential.user!.uid)
            .set(user.toJson());
        res = "success";
      } else {
        res = 'Fill all the requered';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        res = 'The account already exists for that email.';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

//login
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

//logout
  Future<void> signOut() async {
    await _auth.signOut();
  }

  //get user details

  Future<Map<String, dynamic>?> getUserD4etails() async {
    Map<String, dynamic>? userData;
    var uid = _auth.currentUser!.uid;
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (documentSnapshot.exists) {
        userData = documentSnapshot.data() as Map<String, dynamic>;
      } else {
        print('Document with UID $uid does not exist.');
      }
    } catch (e) {
      // Handle error
      print('Error fetching data: $e');
    }

    return userData;
  }

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firebaseFirestore.collection('user').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  //testing area
  Future<List<Map<String, dynamic>>> fetchDataFromFirestore() async {
    List<Map<String, dynamic>> dataList = [];

    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('user').get();

      querySnapshot.docs.forEach((doc) {
        dataList.add(doc.data() as Map<String, dynamic>);
      });
    } catch (e) {
      // Handle error
      print('Error fetching data: $e');
    }

    return dataList;
  }
}
