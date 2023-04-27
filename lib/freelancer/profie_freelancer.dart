import 'package:flexibleea/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class FreelancerProfile extends StatefulWidget {
  const FreelancerProfile({super.key});

  @override
  State<FreelancerProfile> createState() => _FreelancerProfileState();
}

class _FreelancerProfileState extends State<FreelancerProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarApp(
          indexNum: 3,
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Profile'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(223, 163, 47, 220),
            ),
          ),
        ),
      ),
    );
  }
}
