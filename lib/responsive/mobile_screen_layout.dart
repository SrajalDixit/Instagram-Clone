import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone/models/user.dart' as model;

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
      username = (snap.data() as Map<String, dynamic>)['username'];
    });
  }

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('This is mobile')),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? primaryColor : secondaryColor,
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _page == 1 ? primaryColor : secondaryColor,
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: _page == 1 ? primaryColor : secondaryColor,
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: _page == 1 ? primaryColor : secondaryColor,
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _page == 1 ? primaryColor : secondaryColor,
            ),
          ),
        ],
        
      ),
    );
  }
}
