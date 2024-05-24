// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/constants/app_constant.dart';
import 'package:whatsapp_clone/providers/tab_controller_provider.dart';
import 'package:whatsapp_clone/tabs/home_tab.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List tabScreens = [
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];

    List<PersistentTabConfig> _navBarsItems(TabControllerProvider tcp) {
      return List.generate(
        AppConstant.tabIconList.length,
        (index) => PersistentTabConfig(
          screen: tabScreens[index],
          item: ItemConfig(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: tcp.navbarActiveIndex == index
                          ? Color(0xFF0F3629)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                  child: Icon(
                    AppConstant.tabIconList[index],
                    color: const Color.fromARGB(255, 237, 236, 236),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  AppConstant.tabTitles[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    var tcp = context.watch<TabControllerProvider>();

    return PopScope(
      onPopInvoked: (didPop) {},
      child: PersistentTabView(
        
        backgroundColor: AppConstant.scaffoldColor,
        tabs: _navBarsItems(tcp),
        navBarHeight: 70,
        onTabChanged: (index) {
          tcp.setNavIndex(index);
        },
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
          
          navBarDecoration: NavBarDecoration(
            
              color: AppConstant.scaffoldColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              padding: EdgeInsets.only(top: 10)),
        ),
        hideNavigationBar: tcp.hideNavBar,
      ),
    );
  }
}
