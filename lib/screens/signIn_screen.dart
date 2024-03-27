import 'package:aarohan/screens/home_screen.dart';
import 'package:aarohan/screens/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aarohan/reusable_widget/reusable_widget.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 198, 84, 49),
                  Color.fromARGB(236, 0, 0, 0),
                ],
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  const Text(
                    'Welcome to',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/images/aarohan.png',
                    height: 22.h,
                  ),
                  SizedBox(height: 2.h),
                  const Text(
                    'AAROHAN',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: 'Anurati'),
                  ),
                  SizedBox(height: 3.h),
                  const Text(
                    'NIT DURGAPUR',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: 'android'),
                  ),
                  SizedBox(height: 11.h),
                  reusableTextField("Enter Email Id", Icons.person_outline,
                      false, _emailTextController),
                  SizedBox(height: 1.h),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      _passwordTextController),
                  SizedBox(height: 3.h),
                  firebaseUIButton(context, true, () {
                    handleSignIn(context);
                  }),
                  signUpOption(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget signUpOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: Container(
            height: 3.h,
            width: 20.w,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(20), // Adjust border radius as needed
              color: Color.fromARGB(32, 113, 199, 242),
            ),
            alignment: Alignment
                .center, // Align text to center horizontally and vertically
            child: const Text(
              "Sign Up",
              style: TextStyle(
                  color: Color.fromARGB(255, 231, 231, 237),
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
        ),
        SizedBox(height: 14.h),
      ],
    );
  }

  Future<void> handleSignIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: ((context) => const HomeScreen())),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions here
      print("Failed to sign in: ${e.message}");
      // Display error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign in: ${e.message}')));
    }
  }
}
