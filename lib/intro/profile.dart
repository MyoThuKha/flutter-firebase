import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/menu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final ageController = TextEditingController();

  Future<void> signUp(String mail, String pass) async {
    if (validate(mail, pass)) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mail,
        password: pass,
      );

      await FirebaseFirestore.instance.collection("users").add({
        "name": firstNameController.text.trim(),
        "display": secondNameController.text.trim(),
        "age": ageController.text.trim(),
      });
    }
  }

  bool validate(String mail, String pass) {
    if (firstNameController.text == "" ||
        secondNameController.text == "" ||
        ageController.text == "") {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    Map<String, String> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Menu();
          }
          return Scaffold(
            body: SingleChildScrollView(
              reverse: true,
              child: SizedBox(
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      children: const <Widget>[
                        Icon(Icons.precision_manufacturing_rounded, size: 80),
                        Text(
                          "Almost There!",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "How should we call you?",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        //first name input
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            controller: firstNameController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 18),
                              hintText: "Full Name",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        //second name input
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(12),
                          ),

                          //input
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            controller: secondNameController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 18),
                              hintText: "Display Name",
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        //confirm input
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(12),
                          ),

                          //input
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            controller: ageController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 18),
                              hintText: "Age",
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),

                    //submit button
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            signUp(data['mail']!, data['password']!);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.deepPurple,
                            ),
                            child: const Center(
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),

                        //final
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
