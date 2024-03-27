import 'package:aarohan/screens/home_screen.dart';
import 'package:aarohan/screens/signIn_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int _selectedIndex =
      2; // Initialize with the index of the default selected item

  // Add a method to handle item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Row(
            children: [
              Text(
                'AAROHAN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontFamily: 'Anurati',
                ),
              ),
              IconButton(
                icon: Image.asset('assets/images/aarohan.png'),
                onPressed: () {},
              ),
            ],
          ),
        ],
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              });
            },
          );
        }),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 5, 5, 5),
                Color.fromARGB(255, 159, 90, 5),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.transparent,
                width: 100.w,
                height: 10.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/images/registration2.png',
                        height: 4.h,
                      ),
                      onPressed: () {},
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WANT TO ATTEND OUR EVENT?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'android',
                            color: Colors.black,
                            fontSize: 13.sp,
                          ),
                        ),
                        Text(
                          'REGISTER HERE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'android',
                            color: Colors.black,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 50.w,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Mycards(
                              imagePath: 'assets/images/image1.jpeg',
                              descriptionText: 'MAZEMARIZE',
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('Register',
                                style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              _launchInstagramURL(
                                  'https://docs.google.com/forms/d/e/1FAIpQLSdWLx05MrhpTV_bEl8EoKpAGKRQPuCZKquoJC5y60bXzOEh9w/viewform?usp=sf_link');
                            },
                          ),
                          Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Mycards(
                              imagePath: 'assets/images/image2.jpeg',
                              descriptionText: '3D-PRINTING',
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('Register',
                                style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              _launchInstagramURL(
                                  'https://docs.google.com/forms/d/e/1FAIpQLSdWLx05MrhpTV_bEl8EoKpAGKRQPuCZKquoJC5y60bXzOEh9w/viewform?usp=sf_link');
                            },
                          ),
                          Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Mycards(
                              imagePath: 'assets/images/image3.jpeg',
                              descriptionText: 'ROBOLIGA',
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('Register',
                                style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              _launchInstagramURL(
                                  'https://docs.google.com/forms/d/e/1FAIpQLSdWLx05MrhpTV_bEl8EoKpAGKRQPuCZKquoJC5y60bXzOEh9w/viewform?usp=sf_link');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50.w,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Mycards(
                              imagePath: 'assets/images/image3.jpeg',
                              descriptionText: 'MAZEMARIZE',
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('Register',
                                style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              _launchInstagramURL(
                                  'https://docs.google.com/forms/d/e/1FAIpQLSdWLx05MrhpTV_bEl8EoKpAGKRQPuCZKquoJC5y60bXzOEh9w/viewform?usp=sf_link');
                            },
                          ),
                          Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Mycards(
                              imagePath: 'assets/images/image1.jpeg',
                              descriptionText: '3D-PRINTING',
                              // onTap: () => ,
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('Register',
                                style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              _launchInstagramURL(
                                  'https://docs.google.com/forms/d/e/1FAIpQLSdWLx05MrhpTV_bEl8EoKpAGKRQPuCZKquoJC5y60bXzOEh9w/viewform?usp=sf_link');
                            },
                          ),
                          Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Mycards(
                              imagePath: 'assets/images/image2.jpeg',
                              descriptionText: 'ROBOLIGA',
                              // onTap: () => ,
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('Register',
                                style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              _launchInstagramURL(
                                  'https://docs.google.com/forms/d/e/1FAIpQLSdWLx05MrhpTV_bEl8EoKpAGKRQPuCZKquoJC5y60bXzOEh9w/viewform?usp=sf_link');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(90.h),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                20.h,
              ),
              topRight: Radius.circular(
                20.h,
              ),
            ),
          ),
          // color: Colors.amber,
          child: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 3, 103, 186),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                ),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                  color: Colors.black,
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegistrationScreen(),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/registration2.png',
                    color: Colors.black,
                    height: 2.5.h,
                  ),
                ),
                label: 'Registration',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor:
                Colors.blue, // Customize selected item color if needed
            onTap: _onItemTapped, // Handle item selection
          ),
        ),
      ),
    );
  }
}

Future<void> _launchInstagramURL(String url) async {
  try {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Fallback to opening the URL in a web browser
      await launch(url, forceSafariVC: false);
    }
  } catch (e) {
    print('Error launching URL: $e');
  }
}
