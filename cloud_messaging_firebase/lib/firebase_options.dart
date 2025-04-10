// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCvrxpNrefO9G_aW14fXkjUyut0KEoX-Sw',
    appId: '1:771964469178:web:0d2d63404cb737ded6a783',
    messagingSenderId: '771964469178',
    projectId: 'act14-10ce4',
    authDomain: 'act14-10ce4.firebaseapp.com',
    storageBucket: 'act14-10ce4.firebasestorage.app',
    measurementId: 'G-6HHL1ZFQ9H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXMl3_CkvxHKdn4O9AqeDr3VhyJLLXkv4',
    appId: '1:771964469178:android:8d88bbd0678feb9dd6a783',
    messagingSenderId: '771964469178',
    projectId: 'act14-10ce4',
    storageBucket: 'act14-10ce4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBODU5Ghf7ssFmagIft1xQbS42H70DeTMM',
    appId: '1:771964469178:ios:a6d68fc2c895c15cd6a783',
    messagingSenderId: '771964469178',
    projectId: 'act14-10ce4',
    storageBucket: 'act14-10ce4.firebasestorage.app',
    iosBundleId: 'com.example.cloudMessagingFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBODU5Ghf7ssFmagIft1xQbS42H70DeTMM',
    appId: '1:771964469178:ios:a6d68fc2c895c15cd6a783',
    messagingSenderId: '771964469178',
    projectId: 'act14-10ce4',
    storageBucket: 'act14-10ce4.firebasestorage.app',
    iosBundleId: 'com.example.cloudMessagingFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCvrxpNrefO9G_aW14fXkjUyut0KEoX-Sw',
    appId: '1:771964469178:web:7883b004b706165dd6a783',
    messagingSenderId: '771964469178',
    projectId: 'act14-10ce4',
    authDomain: 'act14-10ce4.firebaseapp.com',
    storageBucket: 'act14-10ce4.firebasestorage.app',
    measurementId: 'G-M9R3GK6Z23',
  );
}
