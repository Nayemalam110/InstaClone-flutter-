import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/resources/auth_methods.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  void clearText() {
    _emailController.clear();
    _passwordController.clear();
    _bioController.clear();
    _userNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              height: 64,
            ),
            SizedBox(
              height: 64,
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  // backgroundColor: Colors.red,
                ),
                Positioned(
                  child: IconButton(
                    icon: Icon(Icons.add_a_photo),
                    onPressed: () {},
                  ),
                  bottom: -10,
                  left: 80,
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            TextFieldInput(
                textEditingController: _userNameController,
                hintText: 'Enter the Username',
                textInputType: TextInputType.emailAddress),
            SizedBox(
              height: 24,
            ),
            TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter the Email',
                textInputType: TextInputType.emailAddress),
            SizedBox(
              height: 24,
            ),
            TextFieldInput(
              textEditingController: _passwordController,
              hintText: 'Enter the Password',
              textInputType: TextInputType.text,
              isPass: true,
            ),
            SizedBox(
              height: 24,
            ),
            TextFieldInput(
              textEditingController: _bioController,
              hintText: 'Enter the bio',
              textInputType: TextInputType.text,
            ),
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () async {
                String res = await AuthMethods().singUpUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                    username: _userNameController.text,
                    bio: _bioController.text);
                if (res == "success")
                  setState(() {
                    clearText();
                  });
                print(res);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Sing Up'),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  color: blueColor,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
          ],
        ),
      )),
    );
  }
}
