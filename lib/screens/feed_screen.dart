import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/post_card.dart';

class feedScreen extends StatelessWidget {
  const feedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: SvgPicture.asset('assets/ic_instagram.svg',color: primaryColor,height: 38,),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.messenger_outline_rounded),iconSize: 30,)
        ],
      ),
          

          body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot){
              if(snapshot.connectionState == ConnectionState.waiting)
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context ,index) => PostCard(
                  snap: snapshot.data!.docs[index].data(),
                ),);
            },
          ),
    );
  }
}