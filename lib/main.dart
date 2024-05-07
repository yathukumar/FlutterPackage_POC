import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat/shared/repositories/isar_db.dart';
import 'package:chat/shared/utils/shared_pref.dart';
import 'package:chat/shared/utils/storage_paths.dart';
import 'package:testdemo/error_widget.dart';
import 'firebase_options.dart';
import 'package:social_login/social_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SharedPref.init();
  await IsarDb.init();
  await DeviceStorage.init();

  ErrorWidget.builder = (details) => CustomErrorWidget(details: details);
  return runApp(
    //  const ProviderScope(
      // child: 
      const SocialLogin(),
    // ),
  );
}








