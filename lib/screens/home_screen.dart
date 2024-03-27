import 'package:aarohan/screens/registration.dart';
import 'package:aarohan/screens/exploreScreen.dart';
import 'package:aarohan/screens/profile.dart';
import 'package:aarohan/screens/signIn_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum BottomNavItem { Home, About, Registration, Profile }

List<Widget> images = [
  Image.asset('assets/images/image1.jpeg'),
  Image.asset('assets/images/image2.jpeg'),
  Image.asset('assets/images/image3.jpeg'),
];

List<Widget> itemImages = const [
  Mycards(
    imagePath: 'assets/images/image4.jpeg',
    descriptionText: 'DJ Nights',
    // onTap: () => ,
  ),
  Mycards(
    imagePath: 'assets/images/image5.jpeg',
    descriptionText: 'DJ Nights',
    // onTap: () => ,
  ),
  Mycards(
    imagePath: 'assets/images/image6.jpeg',
    descriptionText: 'DJ Nights',
    // onTap: () => ,
  ),
];

List<Widget> artistItems = const [
  Mycards(
    imagePath: 'assets/images/image7.jpeg',
    descriptionText: 'NAME',
    // onTap: () => ,
  ),
  Mycards(
    imagePath: 'assets/images/image8.jpeg',
    descriptionText: 'NAME',
    // onTap: () => ,
  ),
  Mycards(
    imagePath: 'assets/images/image9.jpeg',
    descriptionText: 'NAME',
    // onTap: () => ,
  ),
  Mycards(
    imagePath: 'assets/images/image10.jpeg',
    descriptionText: 'NAME',
    // onTap: () => ,
  ),
];

List<Widget> eventItems = [
  const EventDateItems(
    descriptionText: 'fill date as reqd',
  ),
  const EventDateItems(
    descriptionText: 'fill date as reqd',
  ),
  const EventDateItems(
    descriptionText: 'fill date as reqd',
  ),
];

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex =
      0; // Initialize with the index of the default selected item

  // Add a method to handle item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => Scaffold(
        backgroundColor: Colors.black,
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
                SizedBox(
                  width: 33.w,
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.logout),
                  color: Colors.white,
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    });
                  },
                ),
              ],
            ),
          ],
          leading: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                child: Image.asset('assets/images/aarohan.png'),
              ),
            ],
          ),
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
        body: Container(
          color: const Color.fromARGB(255, 0, 0, 0),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                CarouselSlider(
                  items: images,
                  options: CarouselOptions(
                    height: 40.h,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
                SizedBox(height: 3.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(2.h),
                  child: Container(
                    color: Colors.white,
                    height: 10.h,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'assets/images/trending.png',
                            height: 3.5.h,
                          ),
                          onPressed: () {},
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'TRENDING EVENTS',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily:
                                    'assets/fonts/Oswald-VariableFont_wght.ttf',
                                color: Colors.black,
                                fontSize: 12.sp,
                              ),
                            ),
                            Text(
                              'The most, exciting events',
                              style: TextStyle(
                                fontFamily:
                                    'assets/fonts/Tauri/Tauri-Regular.ttf',
                                color: Colors.black54,
                                fontSize: 9.sp,
                              ),
                            ),
                            Text(
                              "happening around you",
                              style: TextStyle(
                                fontFamily:
                                    'assets/fonts/Tauri/Tauri-Regular.ttf',
                                color: Colors.black54,
                                fontSize: 9.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 6.5.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(217, 238, 226, 226),
                                borderRadius: BorderRadius.circular(
                                    10), // Adjust the radius as needed
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.view_list),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 30.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Mycards(
                          imagePath: 'assets/images/image1.jpeg',
                          descriptionText: 'MAZEMARIZE',
                          // onTap: () => ,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Mycards(
                          imagePath: 'assets/images/image2.jpeg',
                          descriptionText: '3D-PRINTING',
                          // onTap: () => ,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Mycards(
                          imagePath: 'assets/images/image3.jpeg',
                          descriptionText: 'ROBOLIGA',
                          // onTap: () => ,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TitleBar(
                  title: 'DJ NIGHTS',
                  trailingIcon: const Icon(Icons.view_list),
                  icon: Image.asset(
                    'assets/images/music.png',
                    height: 6.h,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                ItemListView(
                  images: itemImages,
                ),
                SizedBox(
                  height: 2.h,
                ),
                const TitleBar(
                  title: 'EVENTS THIS WEEK',
                  trailingIcon: Icon(Icons.view_list),
                  icon: Icon(Icons.event),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 30.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.h),
                        ),
                        child: const Mycards(
                          imagePath: 'assets/images/image1.jpeg',
                          descriptionText: 'MAZEMARIZE',
                          // onTap: () => ,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Mycards(
                          imagePath: 'assets/images/image2.jpeg',
                          descriptionText: '3D-PRINTING',
                          // onTap: () => ,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Mycards(
                          imagePath: 'assets/images/image3.jpeg',
                          descriptionText: 'ROBOLIGA',
                          // onTap: () => ,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TitleBar(
                  title: 'ARTISTS',
                  trailingIcon: const Icon(Icons.view_list),
                  icon: Image.asset(
                    'assets/images/microphone-removebg-preview.png',
                    height: 5.h,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const ArtistListView(
                  artistName: 'artistName',
                  artistImagePath: 'artistImagePath',
                  followLink: 'followLink',
                )
              ],
            ),
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
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
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
      ),
      // Show the selected page
    );
  }
}

class Mycards extends StatelessWidget {
  const Mycards({
    super.key,
    required this.imagePath,
    required this.descriptionText,
    // required this.onTap,
  });
  final String imagePath;
  final String descriptionText;
  // final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => onTap,
      child: SizedBox(
        height: 48.h,
        width: 48.w,
        child: Card(
          color: const Color.fromARGB(45, 0, 0, 0),
          elevation: 10.h, // Elevation adds shadow to the card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.h),
          ),
          child: Padding(
            padding: EdgeInsets.all(1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 1.h),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.h),
                    topRight: Radius.circular(2.h),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: double
                        .infinity, // Set the width to fill the card horizontally
                    fit: BoxFit
                        .cover, // Adjust the image size to cover the entire area
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  descriptionText,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key? key,
    required this.title,
    required this.trailingIcon,
    required this.icon,
  }) : super(key: key);

  final String title;
  final Widget trailingIcon;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 1.h,
        ),
        color: Colors.white,
        height: 9.h,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: icon,
              onPressed: () {},
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'assets/fonts/Oswald-VariableFont_wght.ttf',
                      color: Colors.black,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5.h,
              width: 8.h,
              decoration: BoxDecoration(
                color: const Color.fromARGB(217, 238, 226, 226),
                borderRadius:
                    BorderRadius.circular(1.h), // Adjust the radius as needed
              ),
              child: IconButton(
                onPressed: () {},
                icon: trailingIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemListView extends StatelessWidget {
  const ItemListView({super.key, required this.images});
  final List<Widget> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(1.h),
      ),
      child: SizedBox(
        height: 30.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: images,
        ),
      ),
    );
  }
}

class EventDateItems extends StatelessWidget {
  const EventDateItems({
    super.key,
    required this.descriptionText,
  });
  final String descriptionText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        elevation: 10.h, // Elevation adds shadow to the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Text(
                  descriptionText,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArtistListView extends StatelessWidget {
  const ArtistListView({
    super.key,
    required this.artistName,
    required this.artistImagePath,
    required this.followLink,
  });
  final String artistName;
  final String artistImagePath;
  final String followLink;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        child: Card(
          color: Colors.black,
          elevation: 10.h, // Elevation adds shadow to the card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/aseem.jpeg',
                      ),
                      radius: 6.2.h,
                    ),
                    Text(
                      'Aseem Sharma',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('+ Follow',
                          style: TextStyle(color: Colors.blue)),
                      onPressed: () {
                        _launchInstagramURL(
                            'https://www.instagram.com/aseemsharmamusic/');
                      },
                    )
                  ],
                ),
                SizedBox(
                  width: 3.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/Shivangi narula.jpeg',
                      ),
                      radius: 6.2.h,
                    ),
                    Text(
                      'Shivangi narula',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('+ Follow',
                          style: TextStyle(color: Colors.blue)),
                      onPressed: () {
                        _launchInstagramURL(
                            'https://www.instagram.com/her_royal_salad/');
                      },
                    )
                  ],
                ),
                SizedBox(
                  width: 3.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/Vijender chauhan.jpeg',
                      ),
                      radius: 6.2.h,
                    ),
                    Text(
                      'Vijender Chauhan',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('+ Follow',
                          style: TextStyle(color: Colors.blue)),
                      onPressed: () {
                        _launchInstagramURL(
                            'https://www.instagram.com/masijeevi/');
                      },
                    )
                  ],
                ),
                SizedBox(
                  width: 3.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/rajat chauhan.jpeg',
                      ),
                      radius: 6.2.h,
                    ),
                    Text(
                      'Rajat Chauhan',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('+ Follow',
                          style: TextStyle(color: Colors.blue)),
                      onPressed: () {
                        _launchInstagramURL(
                            'https://www.instagram.com/officialrajatchauhan/');
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
}
