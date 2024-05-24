// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/constants/app_constant.dart';
import 'package:whatsapp_clone/providers/user_provider.dart';
import 'package:whatsapp_clone/screens/home.dart';
import 'package:whatsapp_clone/screens/login.dart';
import 'package:whatsapp_clone/utils/helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String profileImage = "";
  bool connection = false;
  bool _isDisposed = false; // Add this flag

  @override
  void dispose() {
    _isDisposed = true; // Set the flag to true when disposing the widget
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Color(0xFF273443),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
            ),
            Center(
              child: Image.asset(
                AppConstant.splashIcon,
                height: 100,
                width: 100,
              ),
            ),
            Spacer(),
            Text(
              "from",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            Center(
              child: Image.asset(
                AppConstant.metaIcon,
                width: 80,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  void navigate() async {
    final UserProvider ub = context.read<UserProvider>();
    SharedPreferences? sp = await SharedPreferences.getInstance();

    bool? isSignedIn = sp.getBool("isSignedIn");
    debugPrint(isSignedIn.toString());

    Future.delayed(const Duration(milliseconds: 1500)).then((value) async {
      ub.getUserData().then((value) async {
        if (isSignedIn == true) {
          Helper.nextScreenCloseOthers(context, Home());
        } else {
          Helper.nextScreenCloseOthers(context, LogIn());
        }
      });
    });
  }
}
