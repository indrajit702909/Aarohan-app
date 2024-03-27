import 'package:aarohan/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:aarohan/reusable_widget/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _passwordTextController =
        TextEditingController();
    final TextEditingController _emailTextController = TextEditingController();
    final TextEditingController _userNameTextController =
        TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 5, 2),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(197, 126, 29, 0),
        title: Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          2.h,
          2.h,
          2.h,
          0.h,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Lets get your space suits ready!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 11.5.sp,
                  fontFamily: 'android'),
            ),
            Image.asset(
              'assets/images/space-ezgif.com-video-to-gif-converter.gif',
              width: 100.w,
              height: 35.h,
            ),
            SizedBox(height: 3.h),
            reusableTextField("Enter UserName", Icons.person_outline, false,
                _userNameTextController),
            SizedBox(height: 2.h),
            reusableTextField("Enter Email Id", Icons.email_outlined, false,
                _emailTextController),
            SizedBox(height: 2.h),
            reusableTextField("Enter Password", Icons.lock_outlined, true,
                _passwordTextController),
            SizedBox(height: 2.h),
            firebaseUIButton(context, true, () {
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text,
              )
                  .then((value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              }).catchError((error) {
                // Handle error
              });
            }),
          ],
        ),
      ),
    );
  }
}
