import 'package:flexibleea/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class FreelancerProfile extends StatefulWidget {
  final String userID;

  const FreelancerProfile({required this.userID});

  @override
  State<FreelancerProfile> createState() => _FreelancerProfileState();
}

class _FreelancerProfileState extends State<FreelancerProfile> {
  String? name;
  String email = '';
  String phoneNumber = '';
  String imageUrl = '';
  String joinedAt = '';
  bool _isLoading = false;
  bool _isSameUser = false;
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
      ),
    );
  }
}
