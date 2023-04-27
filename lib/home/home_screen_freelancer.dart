import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarApp(indexNum: 0),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Home'),
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
