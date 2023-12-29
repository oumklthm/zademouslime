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
    apiKey: 'AIzaSyBSuZVc-l-7VgfwOFwpyv2dMOsA6Arp-cc',
    appId: '1:678623065090:web:b21f31000ac037b9a0231b',
    messagingSenderId: '678623065090',
    projectId: 'edkaryfir',
    authDomain: 'edkaryfir.firebaseapp.com',
    storageBucket: 'edkaryfir.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvVwRy73tHGMrPqzJ-ONfJiOKQZDJ47Uk',
    appId: '1:678623065090:android:7fa88be772c53bf8a0231b',
    messagingSenderId: '678623065090',
    projectId: 'edkaryfir',
    storageBucket: 'edkaryfir.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTF31jNgnZOWGVnaKMEiXqFiZ8OdjaYz0',
    appId: '1:678623065090:ios:e868a32e66174a7fa0231b',
    messagingSenderId: '678623065090',
    projectId: 'edkaryfir',
    storageBucket: 'edkaryfir.appspot.com',
    iosBundleId: 'com.example.edkarymeslime',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTF31jNgnZOWGVnaKMEiXqFiZ8OdjaYz0',
    appId: '1:678623065090:ios:4a09f3802878f9faa0231b',
    messagingSenderId: '678623065090',
    projectId: 'edkaryfir',
    storageBucket: 'edkaryfir.appspot.com',
    iosBundleId: 'com.example.edkarymeslime.RunnerTests',
  );
}
