import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vijay/firebase_options.dart';
import 'package:vijay/pages/authentication_form.dart';
import 'package:vijay/pages/home_page.dart';
import 'package:vijay/pages/insta_home_page.dart';
import 'package:vijay/pages/insta_profile_page.dart';
import 'package:vijay/pages/login_page.dart';
import 'package:vijay/pages/signup_pages.dart';
import 'package:vijay/pages/splash_page.dart';
import 'package:vijay/practise/practise_page_1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //used to remove the debug banner
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const InstaHomePage();
          } else {
            return const SignupPage();
          }
        },
      ),
    );
  }
}
