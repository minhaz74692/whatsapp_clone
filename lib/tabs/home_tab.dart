// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/constants/app_constant.dart';
import 'package:whatsapp_clone/providers/auth_provider.dart';
import 'package:whatsapp_clone/widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ap = context.read<FirebaseAuthProvider>();
    List<String> nameList = [
      "rakib",
      "Monirul Islam",
      "Siam IPE",
      "Ammu",
      "Abbu",
      "Monir Bhai Rampura",
      "Hridoy",
      "Kamrul",
      "Harun Mama",
      "Caretaker Kaka"
    ];
    return Scaffold(
      backgroundColor: AppConstant.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppConstant.scaffoldColor,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(top: 18),
          child: Text(
            "WhatsApp",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 18),
            child: Row(
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.more_vert_sharp,
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
          )
        ],
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: const Color.fromARGB(255, 65, 63, 63),
            ),
            ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: nameList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            fit: BoxFit.cover,
                            AppConstant.avator1,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              nameList[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            'message from ${nameList[index].length > 7 ? nameList[index].substring(0, 6) : nameList[index]}...',
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              color: Color.fromARGB(255, 186, 184, 184),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          '10:10 PM',
                          style: TextStyle(
                            color: Color.fromARGB(255, 186, 184, 184),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      )
                    ],
                  ),
                );
              },
            ),
            Center(
              child: PrimaryButton(
                title: "Log Out",
                onPressed: () async {
                  ap.signOut(context);
                },
              ),
            ),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
