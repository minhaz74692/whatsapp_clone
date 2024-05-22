// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/app_constant.dart';
import 'package:whatsapp_clone/screens/homepage.dart';
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
            Text("from",style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
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
    // bool result = await InternetConnectionChecker().hasConnection;

    // if (result == true) {
    Future.delayed(const Duration(seconds: 3), () async {
      if (!_isDisposed) {
        Helper.nextScreenCloseOthers(
          context,
          HomeScreen(),
        );
      }
    });
    // } else {
    //   Helper.toScreen(context, const NoInternetScreen());

    //   Future.delayed(const Duration(seconds: 5), () {
    //     if (!_isDisposed) {
    //       if (Provider.of<AuthProvider>(context, listen: false)
    //           .getUserToken()
    //           .isEmpty) {
    //         Navigator.pushAndRemoveUntil(
    //           context,
    //           MaterialPageRoute(builder: (_) => const LoginScreen()),
    //           (route) => false,
    //         );
    //       } else {
    //         if (!_isDisposed) {
    //           Navigator.pushAndRemoveUntil(
    //             context,
    //             MaterialPageRoute(builder: (_) => const DashboardScreen()),
    //             (route) => false,
    //           );
    //         }
    //       }
    //     }
    //   });
    // }
  }
}
