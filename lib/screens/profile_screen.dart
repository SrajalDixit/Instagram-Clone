import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/follow_button.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;
  const ProfileScreen({Key? key, required this.uid}) : super(key:key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
var userData ={};
  @override
  void initState() {
    
    super.initState();
    getData();
  }

  getData() async{
    try{
      var snap = await FirebaseFirestore.instance.collection('users').doc(widget.uid).get();
      userData = snap.data()!;
      setState(() {
        
      });
    }
    catch(e)
    {
      showSnackBar(e.toString(),context);

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
       title: Text(userData['username'] ?? 'Username'),

      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          userData['photoUrl'] ?? 'profile pic',),
                      radius: 40,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildStateColumn(50, 'posts'),
                              buildStateColumn(510, 'followers'),
                              buildStateColumn(300, 'following'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FollowButton(
                                backgroundColor: mobileBackgroundColor,
                                borderColor: Colors.grey,
                                text: 'Edit profile',
                                textColor: primaryColor,
                                function: () {},
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    'username',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(
                    'Some Description',
                    
                  ),
                ),
              ],
            ),
            
          ),
          const Divider(),
        ],
      ),
    );
  }

  Column buildStateColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4),
          child: Text(
            label.toString(),
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
