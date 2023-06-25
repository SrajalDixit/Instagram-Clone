import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class mobileScreenLayout extends StatefulWidget {
  const mobileScreenLayout({super.key});

  @override
  State<mobileScreenLayout> createState() => _mobileScreenLayoutState();
}

class _mobileScreenLayoutState extends State<mobileScreenLayout> {
  String username = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
  }

  void getUsername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

       setState(() {
         username = (snap.data() as Map<String , dynamic>)['username'];
       });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('This is mobile')),
    );
    
  }
}
