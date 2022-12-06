import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final VoidCallback toggle;
  const SignUp({super.key, required this.toggle});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final mailController = TextEditingController();
  final passController = TextEditingController();
  final confirmController = TextEditingController();

  Future<void> signUp() async {
    if (validate()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mailController.text.trim(),
        password: passController.text.trim(),
      );
    }
  }

  void goToProfile() async {
    if (validate()) {
      Navigator.pushNamed(context, "/profile", arguments: {
        'mail': mailController.text.trim(),
        'password': passController.text.trim(),
      });
    }
  }

  bool validate() {
    if (mailController.text == "" || passController.text == "") {
      return false;
    }
    if (confirmController.text == passController.text) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    mailController.dispose();
    passController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Icon(Icons.android_rounded, size: 80),
                  Text(
                    "Hello There!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Let's prepare your Account",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),

              Column(
                children: <Widget>[
                  //email input
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(8),
                    ),

                    //input
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: mailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                        hintText: "email",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  //password input
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(12),
                    ),

                    //input
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: passController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                        hintText: "password",
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
                      controller: confirmController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                        hintText: "confirm password",
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
                      // signUp();
                      goToProfile();
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
                          "Next Step",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //final
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Already member?"),
                      TextButton(
                        onPressed: () => widget.toggle(),
                        child: const Text("Sign In"),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
