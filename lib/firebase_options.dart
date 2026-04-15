
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBzoKwGn--eIxvgeROBALaSXOIqCOpYx48',
    appId: '1:335464692578:android:f4db01f243b943e2b2ca3b',
    messagingSenderId: '335464692578',
    projectId: 'notebook-f99b9',
    authDomain: 'salespro-19e86.firebaseapp.com',
    storageBucket: 'notebook-f99b9.appspot.com',
  );



  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzoKwGn--eIxvgeROBALaSXOIqCOpYx48',
    appId: '1:335464692578:android:f4db01f243b943e2b2ca3b',
    messagingSenderId: '335464692578',
    projectId: 'notebook-f99b9',
    storageBucket: 'notebook-f99b9.appspot.com',
  );


  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2DS3REO61nzIYOijW4GOHmyemlQrr4QI',
    appId: '1:453829112125:ios:a65a63d927a1f664e6d554',
    messagingSenderId: '453829112125',
    projectId: 'salespro-19e86',
    storageBucket: 'salespro-19e86.appspot.com',
    iosClientId: '453829112125-s8knjn86uhrqbp426m4vge5tj545mlc4.apps.googleusercontent.com',
    iosBundleId: 'com.maantheme.mobilepos.mobilePos',
  );
}