import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_facebook/google/homepage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => signUpUserUsingGoogle(context),
          child: const Text('SignIn With Google'),
        ),
      ),
    );
  }

  void signUpUserUsingGoogle(BuildContext context) async {
    try {
      // creating instance of google GoogleSignIn
      GoogleSignIn googleSignIn = GoogleSignIn();

      // Waiting for using to select account
      // If user select get the selected google account -> GoogleSignInAccount
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        // getting GoogleSignInAuthentication to get accessToken and idToken
        // of selected user
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        // Creating OAuthCredential using accessToken and idToken
        OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
        log('Account Created');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GoogleHomePage(),
          ),
        );
      } else {
        log('Not Signed In with google');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
