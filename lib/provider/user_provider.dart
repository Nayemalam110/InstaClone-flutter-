import 'package:flutter/widgets.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();
  User us = User(
      username: '',
      uid: '',
      photoUrl: '',
      email: '',
      bio: '',
      followers: [],
      following: []);

  User get getUser {
    if (_user == null) {
      return us;
    } else
      return _user!;
  }

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
