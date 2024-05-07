import 'package:flutter/material.dart';
import 'package:social_login/pages/signIn.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SignIn(),
    );
  }
}