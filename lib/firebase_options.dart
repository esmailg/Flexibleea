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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMjnRjv_B3kY8h-7FDvIC8TyxqytsxLKM',
    appId: '1:240261193265:android:61580097ff07c75922bf10',
    messagingSenderId: '240261193265',
    projectId: 'flexibleea-5b117',
    storageBucket: 'flexibleea-5b117.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdvvDmgBTOz99-RJm6nysusmDcOXjctgg',
    appId: '1:240261193265:ios:e0076621d27eea8422bf10',
    messagingSenderId: '240261193265',
    projectId: 'flexibleea-5b117',
    storageBucket: 'flexibleea-5b117.appspot.com',
    iosClientId: '240261193265-r6u5pql28h5fv1a41jdphh7ebrdc4jqr.apps.googleusercontent.com',
    iosBundleId: 'com.example.flexibleea',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdvvDmgBTOz99-RJm6nysusmDcOXjctgg',
    appId: '1:240261193265:ios:e0076621d27eea8422bf10',
    messagingSenderId: '240261193265',
    projectId: 'flexibleea-5b117',
    storageBucket: 'flexibleea-5b117.appspot.com',
    iosClientId: '240261193265-r6u5pql28h5fv1a41jdphh7ebrdc4jqr.apps.googleusercontent.com',
    iosBundleId: 'com.example.flexibleea',
  );
}
