import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBnqo0NmCULiMQwpl0f16aFjmIgz5M83y4",
            authDomain: "potty-mouth-373917.firebaseapp.com",
            projectId: "potty-mouth-373917",
            storageBucket: "potty-mouth-373917.appspot.com",
            messagingSenderId: "1039002227079",
            appId: "1:1039002227079:web:403af3ae651ae2ca858322",
            measurementId: "G-WQZFXRC27K"));
  } else {
    await Firebase.initializeApp();
  }
}
