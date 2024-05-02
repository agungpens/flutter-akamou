import 'package:flutter_akamou/pages/authentication/login.dart';
import 'package:flutter_akamou/pages/mou/mou.dart';
import 'package:flutter_akamou/pages/prodi/prodi.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_akamou/controller/my_controller.dart';

class DashboardPage extends StatelessWidget {
  final c = Get.find<MyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simouaka',
          style: TextStyle(
            fontFamily: 'Peanut Butter',
            fontSize: 30,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                    onTap: () {
                      // Tambahkan logika untuk menu Profile di sini
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    onTap: () {
                      Get.offAll(() => LoginPage());
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.color_lens),
                    title: Text('Change Theme'),
                    onTap: () {
                      c.changeTheme();
                    },
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, Selamat Datang 👋',
                                style: TextStyle(
                                  fontFamily: 'roboto',
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Agung Aldi P',
                                style: TextStyle(
                                    fontFamily: 'roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildCard(Icons.my_library_books_outlined,
                                    "Momerandum Of Understanding", () {
                                  Get.to(() => MouPage());
                                }),
                                buildCard(Icons.my_library_books,
                                    "Momerandum Of \nAgreement", () {
                                  // Tambahkan logika untuk card Home di sini
                                }),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildCard(
                                    Icons.post_add, "Input Kegiatan \nDokumen",
                                    () {
                                  // Tambahkan logika untuk card Notifications di sini
                                }),
                                buildCard(Icons.account_circle, "Prodi", () {
                                  Get.to(() => ProdiPage());
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Develop by IT, ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          'AKN Putra Sang Fajar!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildCard(IconData icon, String label, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 5,
      child: Container(
        width: 200,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
            ),
            SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'roboto'),
            ),
          ],
        ),
      ),
    ),
  );
}
