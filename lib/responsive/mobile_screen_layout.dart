import 'package:flutter/material.dart';
import 'package:insta_clone/resources/auth_methods.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});
  signout() async {
    AuthMethods().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(12),
              color: Colors.teal,
              child: TextButton(onPressed: signout, child: Text('SingOUt'))),
          Center(child: Text('This is Moblie')),
        ],
      ),
    );
  }
}
