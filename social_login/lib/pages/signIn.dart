import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_login/colors.dart';
import 'package:social_login/constant.dart';
import 'package:social_login/widgets/custom_widget.dart';
import 'auth.dart';
import 'home.dart';

class SignIn extends StatefulWidget {

  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

    @override
  void initState() {
    super.initState();
    _ifUserIsLoggedIn();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomWidgets.socialButtonCircle(
                    googleColor, FontAwesomeIcons.google,
                    iconColor: Colors.white, onTap: () async {
                        UserCredential? userCredential = await AuthMethods().signInByProviderId(Constant.googleProviderId);
  if(userCredential != null){
                        if (context.mounted) Navigator.push(context,MaterialPageRoute(builder: (context) => Home(users: userCredential.user)));      
                        }                        }),
                CustomWidgets.socialButtonCircle(
                    facebookColor, FontAwesomeIcons.facebook,
                    iconColor: Colors.white, onTap: () async{
                        UserCredential? userCredential = await AuthMethods().signInByProviderId(Constant.facebookProviderId);
                        if(userCredential != null){
                        if (context.mounted) Navigator.push(context,MaterialPageRoute(builder: (context) => Home(users: userCredential.user)));      
                        }
                                      }),
                Platform.isIOS ? 
                CustomWidgets.socialButtonCircle(
                    appleColor, FontAwesomeIcons.apple,
                    iconColor: Colors.white, onTap: () async{
                              UserCredential? userCredential = await AuthMethods().signInByProviderId(Constant.appleProviderId);
  if(userCredential != null){
                        if (context.mounted) Navigator.push(context,MaterialPageRoute(builder: (context) => Home(users: userCredential.user)));      
                        }                }) : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Future<void> _ifUserIsLoggedIn() async {
    User? userCredential = await AuthMethods().getCurrentUser();
    if (context.mounted) Navigator.push(context,MaterialPageRoute(builder: (context) => Home(users: userCredential)));      
    }
}