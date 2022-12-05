import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final mailController = TextEditingController();

  @override
  void dispose() {
    mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      reverse: true,
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Title
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.mail_lock_rounded,
                  size: 80,
                ),
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "We will send reset email to You",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),

            //email input
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
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

                const SizedBox(height: 24),

                //send button
                TextButton(
                  onPressed: () {},
                  child: const Text("Send Reset Mail"),
                )
              ],
            ),

            //reset button
          ],
        ),
      ),
    ));
  }
}
