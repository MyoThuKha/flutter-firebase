import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(12),
            ),
            child: GestureDetector(
              onTap: () => logout(),
              child: const ListTile(
                title: Text("Log out"),
                trailing: (Icon(
                  Icons.logout_rounded,
                  color: Colors.black,
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
