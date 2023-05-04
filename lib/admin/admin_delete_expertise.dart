import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexibleea/widgets/bottom_nav_bar_admin.dart';
import 'package:flutter/material.dart';
import '../widgets/expertise_admin.dart';

class AdminExpertise extends StatefulWidget {
  const AdminExpertise({super.key});

  @override
  State<AdminExpertise> createState() => _AdminExpertiseState();
}

class _AdminExpertiseState extends State<AdminExpertise> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? expertiseCategoryFilter;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        bottomNavigationBar: AdminNavigationBarApp(indexNum: 1),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(223, 163, 47, 220),
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('Freelancer Expertise')
                .where('category', isEqualTo: expertiseCategoryFilter)
                .where('recruitment', isEqualTo: true)
                .orderBy('createdAt', descending: false)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data?.docs.isNotEmpty == true) {
                  return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ExpertiseWidgetAdmin(
                            expertiseTitle: snapshot.data?.docs[index]
                                ['expertise'],
                            expertiseDescription: snapshot.data?.docs[index]
                                ['description'],
                            freelancerId: snapshot.data?.docs[index]
                                ['freelancerId'],
                            uploadedBy: snapshot.data?.docs[index]
                                ['uploadedBy'],
                            userImage: snapshot.data?.docs[index]['userImage'],
                            name: snapshot.data?.docs[index]['name'],
                            recruitment: snapshot.data?.docs[index]
                                ['recruitment'],
                            email: snapshot.data?.docs[index]['email'],
                            phone: snapshot.data?.docs[index]['phoneNumber'],
                            availableDate: snapshot.data?.docs[index]
                                ['availableDate'],
                            availableTime: snapshot.data?.docs[index]
                                ['availableTime']);
                      });
                } else {
                  return const Center(
                    child: Text('There are no freelancers'),
                  );
                }
              }
              return const Center(
                child: Text(
                  'something went wrong',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
