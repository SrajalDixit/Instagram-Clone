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
          

          body: PostCard(),
    );
  }
}