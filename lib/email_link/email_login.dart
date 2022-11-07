import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWithEmail extends StatelessWidget {
  const LoginWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                UserCredential userCreds =
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: 'mateendev3@gmail.com',
                  password: '1234567890',
                );
                if (userCreds.user != null) {
                  log('--> User Created <--');
                }
              },
              child: const Text('SignIn With email'),
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.currentUser!
                    .sendEmailVerification();
                log('email sent');
              },
              child: const Text('Send Link'),
            ),
          ],
        ),
      ),
    );
  }
}
