import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flexibleea/freelancer/profie_freelancer.dart';
import 'package:flexibleea/home/home_screen_freelancer.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarApp extends StatelessWidget {
  int indexNum = 0;
  BottomNavigationBarApp({required this.indexNum});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: const Color.fromARGB(223, 163, 47, 220),
      buttonBackgroundColor: const Color.fromARGB(255, 255, 254, 251),
      backgroundColor: const Color.fromARGB(156, 211, 141, 247),
      height: 50,
      index: indexNum,
      items: const [
        Icon(
          Icons.home,
          size: 20,
          color: Color.fromARGB(223, 158, 26, 224),
        ),
        Icon(
          Icons.person,
          size: 20,
          color: Color.fromARGB(223, 158, 26, 224),
        )
      ],
      animationDuration: const Duration(
        milliseconds: 350,
      ),
      animationCurve: Curves.bounceIn,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        } else if (index == 1) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const FreelancerProfile()));
        }
      },
    );
  }
}
