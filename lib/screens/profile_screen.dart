import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('username'),
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
                          'https://images.unsplash.com/photo-1694746028047-b105a3543137?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                      radius: 40,
                    ),
                     Expanded(
                       child: Row(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     
                                       children: [
                              buildStateColumn(50, 'posts'),
                              buildStateColumn(510, 'followers'),
                              buildStateColumn(300, 'following'),
                     
                                       ],
                                     ),
                     )

                  ],
                ),
               
              ],
            ),
          )
        ],
      ),
    );
  }
  Column buildStateColumn(int num,String label)
  {
    
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(num.toString(),
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),),
        Text(label.toString(),
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),)
        
      ],
    );
  }
}
