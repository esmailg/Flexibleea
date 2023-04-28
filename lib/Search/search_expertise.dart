import 'package:flexibleea/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Search Expertise'),
          centerTitle: true,
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
