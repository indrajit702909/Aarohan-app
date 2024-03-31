import 'package:aarohan/firebase_options.dart';
import 'package:aarohan/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aarohan/screens/signIn_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aarohan',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepOrange,
          ).copyWith(secondary: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return SignInScreen();
          }
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: Container(
        // color: Colors.black,
        // height: 100.h,
        // width: 1.w,
        child: Column(
          children: [
            Container(
              // height: 50.h,
              // width: 50.w,
              child: const Image(
                image: AssetImage('assets/images/aarohan_logo.png'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'AAROHAN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20.sp,
                fontFamily: 'Anurati',
              ),
            ),
          ],
        ),
      ),
      nextScreen: const AuthPage(),
      backgroundColor: Color.fromARGB(255, 190, 81, 3),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
