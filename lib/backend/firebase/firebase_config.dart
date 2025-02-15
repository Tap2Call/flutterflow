import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAkjBplXmZ4j1u0WaJgFmoRdT0dnEwDHns",
            authDomain: "treehacks-3f859.firebaseapp.com",
            projectId: "treehacks-3f859",
            storageBucket: "treehacks-3f859.firebasestorage.app",
            messagingSenderId: "257180841290",
            appId: "1:257180841290:web:5bc6fa04321fcf6aa83db3",
            measurementId: "G-W5WZV2P5X2"));
  } else {
    await Firebase.initializeApp();
  }
}
