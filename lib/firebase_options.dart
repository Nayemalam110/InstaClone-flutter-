// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDEJk7EKkCO-4Vi_l2gn1CnLYMaHkgK0sk',
    appId: '1:787950230893:web:dc65e1a6a45080dd154e64',
    messagingSenderId: '787950230893',
    projectId: 'insta-clone-96c65',
    authDomain: 'insta-clone-96c65.firebaseapp.com',
    storageBucket: 'insta-clone-96c65.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBp51cZdwrm3ialN5zZ1bUnRgkngduM3Ig',
    appId: '1:787950230893:android:25e3fa3ed3134005154e64',
    messagingSenderId: '787950230893',
    projectId: 'insta-clone-96c65',
    storageBucket: 'insta-clone-96c65.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAes3xW92ojoJ14JbjB_FekPgydGBZ9Tyc',
    appId: '1:787950230893:ios:351f9f4092f47887154e64',
    messagingSenderId: '787950230893',
    projectId: 'insta-clone-96c65',
    storageBucket: 'insta-clone-96c65.appspot.com',
    iosBundleId: 'com.example.instaClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAes3xW92ojoJ14JbjB_FekPgydGBZ9Tyc',
    appId: '1:787950230893:ios:351f9f4092f47887154e64',
    messagingSenderId: '787950230893',
    projectId: 'insta-clone-96c65',
    storageBucket: 'insta-clone-96c65.appspot.com',
    iosBundleId: 'com.example.instaClone',
  );
}
