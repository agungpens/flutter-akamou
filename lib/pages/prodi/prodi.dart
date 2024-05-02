import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:flutter_akamou/controller/prodi/prodi_controller.dart';
import 'package:flutter_akamou/pages/authentication/login.dart';
import 'package:flutter_akamou/controller/my_controller.dart';
// import 'package:flutter_html/flutter_html.dart';

class ProdiPage extends StatelessWidget {
  final MyController c = Get.find<MyController>();
  final ProdiController _prodiController =
      Get.put(ProdiController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Prodi',
          style: TextStyle(
            fontFamily: 'Peanut Butter',
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
      body: Obx(() {
        if (_prodiController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: _prodiController.listProdi.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.school), // Tambahkan ikon disini
                title: Text(_prodiController.listProdi[index].namaProdi),
                // subtitle: Html(data:_prodiController.listProdi[index].keterangan),
              );
            },
          );
        }
      }),
    );
  }
}
