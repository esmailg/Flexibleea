import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/global_variables.dart';

class Persistant {
  static List<String> expertiseList = [
    'Architecture & Construction',
    'Education & Training',
    'Development & Programming',
    'Business',
    'Information Technology',
    'Arts & Design',
    'Marketing',
    'Accounting',
  ];

  void getFreeLancerData() async {
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    name = userDoc.get('name');
    userImage = userDoc.get('userImage');
    phone = userDoc.get('phoneNumber');
  }
}
