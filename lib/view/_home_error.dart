import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/_login_page.dart';
import 'package:flutter_application_1/view/_profile_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return const ProfilePage();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Opps Something worng"),
          );
        } else {
          return const LogIn();
        }
      },
    );
  }
}
