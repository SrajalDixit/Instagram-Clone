import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _biocontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _biocontroller.dispose();
    _usernamecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Flexible(
              child: Container(),
              flex: 4,
            ),
            //svg image
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              color: primaryColor,
              height: 64,
            ),
            const SizedBox(height: 64),

            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1685884852440-b7e379c82c9c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                    child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_a_photo),
                ),
                ),
              ],
            ),
            const SizedBox(height: 64),
            //text field for username
            TextFieldInput(
              textEditingController: _usernamecontroller,
              isPass: false,
              hintText: 'Enter your username',
              keyboardType: TextInputType.text,
            ),

            const SizedBox(
              height: 24,
            ),

            //email text field
            TextFieldInput(
              textEditingController: _emailcontroller,
              isPass: false,
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 24,
            ),

            TextFieldInput(
              textEditingController: _passwordcontroller,
              isPass: true,
              hintText: 'Enter your password',
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(
              height: 24,
            ),

            TextFieldInput(
              textEditingController: _biocontroller,
              isPass: false,
              hintText: 'Enter your Bio',
              keyboardType: TextInputType.text,
            ),

            const SizedBox(
              height: 24,
            ),

            //password text field
            //button Signup
            InkWell(
              child: Container(
                child: Text('Log in'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  color: blueColor,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            //transtioning to signing up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text("Don't have an account?"),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: const Text(
                      "Sign up!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
