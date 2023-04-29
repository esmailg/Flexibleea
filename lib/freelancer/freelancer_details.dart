import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexibleea/home/home_screen_freelancer.dart';
import 'package:flexibleea/services/global_methods.dart';
import 'package:flexibleea/services/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FreelancerDetailsScreen extends StatefulWidget {
  final String uploadedBy;
  final String expertiseId;

  FreelancerDetailsScreen({
    required this.uploadedBy,
    required this.expertiseId,
  });
  @override
  State<FreelancerDetailsScreen> createState() =>
      _FreelancerDetailsScreenState();
}

class _FreelancerDetailsScreenState extends State<FreelancerDetailsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? authorName;
  String? userImageUrl;
  String? expertiseCategory;
  String? expertiseDescription;
  String? expertiseTitle;
  bool? recruitment;
  Timestamp? postedDateTimeStamp;
  Timestamp? dateRange;
  String? requestDate;
  String? availableDate;
  String? availableTime;
  String? email = '';
  String? phoneNumber = '';
  int requests = 0;
  bool isDateAvailable = false;
  bool isTimeAvailable = false;
  bool _isLoading = false;

  requestExpertise() {
    final Uri param = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Requesting expertise in $expertise&body=Greetings,',
    );
    final url = param.toString();
    launchUrlString(url);
    addRequests();
  }

  void addRequests() async {
    var docRef = FirebaseFirestore.instance
        .collection('Freelancer Expertise')
        .doc(widget.expertiseId);

    docRef.update({
      'numberRequests': requests + 1,
    });

    Navigator.pop(context);
  }

  viewQualifications() {}

  void getFreelancerData() async {
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.uploadedBy)
        .get();

    if (userDoc == null) {
      return;
    } else {
      setState(() {
        authorName = userDoc.get('name');
        userImageUrl = userDoc.get('userImage');
      });
    }
    final DocumentSnapshot expertiseDatabase = await FirebaseFirestore.instance
        .collection('Freelancer Expertise')
        .doc(widget.expertiseId)
        .get();
    if (expertiseDatabase == null) {
      return;
    } else {
      setState(() {
        expertiseTitle = expertiseDatabase.get('expertise');
        expertiseDescription = expertiseDatabase.get('description');
        recruitment = expertiseDatabase.get('recruitment');
        email = expertiseDatabase.get('email');
        phoneNumber = expertiseDatabase.get('phoneNumber');
        requests = expertiseDatabase.get('numberRequests');
        postedDateTimeStamp = expertiseDatabase.get('createdAt');
        availableDate = expertiseDatabase.get('availableDate');
        availableTime = expertiseDatabase.get('availableTime');
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFreelancerData();
  }

  Widget dividerWidget() {
    return Column(
      children: const [
        SizedBox(
          height: 7,
        ),
        Divider(
          thickness: 2,
          color: Colors.grey,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(223, 163, 47, 220),
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            expertiseTitle == null ? '' : expertiseTitle!,
                            maxLines: 3,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3,
                                  color:
                                      const Color.fromARGB(255, 109, 19, 199),
                                ),
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    userImageUrl == null
                                        ? 'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/no-profile-picture-icon.png'
                                        : userImageUrl!,
                                  ),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    authorName == null ? '' : authorName!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    phoneNumber!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        dividerWidget(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              requests.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Requests',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(
                              Icons.how_to_reg,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        FirebaseAuth.instance.currentUser!.uid !=
                                widget.uploadedBy
                            ? Container()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  dividerWidget(),
                                  const Text(
                                    'Availability',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          User? user = _auth.currentUser;
                                          final _uid = user!.uid;
                                          if (_uid == widget.uploadedBy) {
                                            try {
                                              FirebaseFirestore.instance
                                                  .collection(
                                                      'Freelancer Expertise')
                                                  .doc(widget.expertiseId)
                                                  .update(
                                                      {'recruitment': true});
                                            } catch (error) {
                                              GlobalMethod.showErrorDialog(
                                                  ctx: context,
                                                  error:
                                                      'action is not completed');
                                            }
                                          } else {
                                            GlobalMethod.showErrorDialog(
                                                ctx: context,
                                                error: 'action prohibited');
                                          }
                                          getFreelancerData();
                                        },
                                        child: const Text(
                                          'ON',
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Color.fromARGB(185, 0, 0, 0),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: recruitment == true ? 1 : 0,
                                        child: const Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.green,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          User? user = _auth.currentUser;
                                          final _uid = user!.uid;
                                          if (_uid == widget.uploadedBy) {
                                            try {
                                              FirebaseFirestore.instance
                                                  .collection(
                                                      'Freelancer Expertise')
                                                  .doc(widget.expertiseId)
                                                  .update(
                                                      {'recruitment': false});
                                            } catch (error) {
                                              GlobalMethod.showErrorDialog(
                                                  ctx: context,
                                                  error:
                                                      'action is not completed');
                                            }
                                          } else {
                                            GlobalMethod.showErrorDialog(
                                                ctx: context,
                                                error: 'action prohibited');
                                          }
                                          getFreelancerData();
                                        },
                                        child: const Text(
                                          'OFF',
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Color.fromARGB(185, 0, 0, 0),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: recruitment == false ? 1 : 0,
                                        child: const Icon(
                                          Icons.error_rounded,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  dividerWidget(),
                                ],
                              ),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          expertiseDescription == null
                              ? ''
                              : expertiseDescription!,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        dividerWidget(),
                        const Text(
                          'Available Dates',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          availableDate == null ? '' : availableDate!,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Available Time',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          availableTime == null ? '' : availableTime!,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        dividerWidget(),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: _isLoading
                                ? const CircularProgressIndicator()
                                : MaterialButton(
                                    onPressed: () {
                                      viewQualifications();
                                    },
                                    color:
                                        const Color.fromARGB(223, 122, 47, 220),
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'View Qualifications',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.picture_as_pdf_rounded,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    requestExpertise();
                  },
                  color: const Color.fromARGB(223, 122, 47, 220),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Request Freelancer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
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
