import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.users});
  final User? users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            users?.photoURL != null ? Image.network(users!.photoURL!) : const SizedBox.shrink(),
            const SizedBox(height: 20,),
           users?.displayName != null ? Text(users!.displayName!) : const SizedBox.shrink(),
            const SizedBox(height: 20,),
            users?.email != null ? Text(users!.email!) : const SizedBox.shrink(),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pop(context);
                }).catchError((e) {});
              },
              height: 50,
              minWidth: 100,
              color: Colors.red,
              child: const Text('Logout',style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}