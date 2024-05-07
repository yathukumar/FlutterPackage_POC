library chat;
import 'package:chat/features/auth/views/welcome.dart';
import 'package:chat/features/home/views/base.dart';
import 'package:chat/shared/utils/abc.dart';
import 'package:chat/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/auth/data/repositories/auth_repository.dart';

class WhatsApp extends ConsumerWidget {
  const WhatsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: "WhatsUp",
      initialRoute: '/',
      theme: ref.read(lightThemeProvider),
      darkTheme: ref.read(darkThemeProvider),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: ref.read(authRepositoryProvider).auth.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return const WelcomePage();
          }

          final user = getCurrentUser();
          if (user == null) {
            return const WelcomePage();
          }

          return HomePage(user: user);
        },
      ),
    );
  }
}
