import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FacebookHomePage extends StatelessWidget {
  const FacebookHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    print(auth.currentUser?.photoURL);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                auth.currentUser?.photoURL ??
                    'https://cdn.pixabay.com/photo/2022/09/18/14/23/baby-7463137_960_720.jpg',
              ),
            ),
            Text(
              auth.currentUser!.displayName!,
            ),
            Text(
              auth.currentUser!.email!,
            ),
            ElevatedButton(
              onPressed: () {
                auth.signOut();
                GoogleSignIn().disconnect();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
