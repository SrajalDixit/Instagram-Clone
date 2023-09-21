import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/responsive/responsive_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/web_screen_layout.dart';

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
  Uint8List? _image;
  bool _isLoading = false;
  AuthMethods authMethods = AuthMethods();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _biocontroller.dispose();
    _usernamecontroller.dispose();
  }

  void navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Loginscreen(),
      ),
    );
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await authMethods.signupUser(
        email: _emailcontroller.text,
        password: _passwordcontroller.text,
        username: _usernamecontroller.text,
        Bio: _biocontroller.text,
        file: _image!);

   setState(() {
     
   });

    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
              webScreenLayout: webScreenLayout(),
              mobileScreenLayout: mobileScreenLayout()),
        ),
      );
    }
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
                _image != null
                    ? CircleAvatar(
                        radius: 64, backgroundImage: MemoryImage(_image!))
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg'),
                      ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage,
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
              onTap: signUpUser,
              child: Container(
                child: _isLoading
                    ? Center(
                        child: const CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : const Text('Sign up'),
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
                  child: const Text("Already have an account?"),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                GestureDetector(
                  onTap: navigateToLogin,
                  child: Container(
                    child: const Text(
                      "Log in!",
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
