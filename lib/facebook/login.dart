import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginWithFacebook extends StatelessWidget {
  const LoginWithFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => signUpUserUsingFacebook(context),
          child: const Text('SignIn With Facebook'),
        ),
      ),
    );
  }

  void signUpUserUsingFacebook(BuildContext context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        // Create a credential from the access token
        log('AccessToken => ${result.accessToken!.token}');
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        log('credentials => $credential');
        log('token => ${credential.token}');
        // Once signed in, return the UserCredential
        await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
