import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/providers/tab_controller_provider.dart';

class AppConstant {
  static String splashIcon = "assets/images/splash.webp";
  static String appIcon = "assets/images/icon.png";
  static String metaIcon = "assets/images/metaIcon.png";
  static String avator1 = "assets/images/avator1.png";
  static Color primaryColor = const Color(0xFF27CA42);
  static Color scaffoldColor = const Color(0xFF0A141B);

  static List<IconData> tabIconList = [
    Icons.message,
    Icons.change_circle_outlined,
    Icons.groups_2_outlined,
    Icons.phone_outlined,
  ];
  static List<String> tabTitles = [
    "Chats",
    "Updates",
    "Communities",
    "Calls",
  ];

  static hideNavBar(bool status, BuildContext context) {
    var tcp = context.read<TabControllerProvider>();
    Future.microtask(() => tcp.setHideNavBar(status));
  }
}
