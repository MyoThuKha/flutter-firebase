import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Signed In As ${user.email}"),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
