import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/bottom_nav_controller.dart';
import 'package:flutter_ecommerce/ui/login_screen.dart';
import 'package:flutter_ecommerce/ui/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late bool LoggedIn;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');

        setState(() {
          LoggedIn = false;
        });
      } else {
        print('User is signed in!');
        setState(() {
          LoggedIn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'IKialo E-Commerce',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoggedIn ? BottomNavController() : LoginScreen(),
        );
      },
    );
  }
}
