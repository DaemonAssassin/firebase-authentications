import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../firebase_options.dart';
import 'homepage.dart';
import 'login.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // check if is running on Web
  if (kIsWeb) {
    // initialize the facebook javascript SDK
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: "1100123497358318",
      cookie: true,
      xfbml: true,
      version: "v14.0",
    );
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirebaseAuth.instance.currentUser != null
          ? const FacebookHomePage()
          : const LoginWithFacebook(),
    );
  }
}
