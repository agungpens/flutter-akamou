import 'package:flutter_akamou/pages/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_akamou/controller/my_controller.dart';

class MouPage extends StatelessWidget {
  final c = Get.find<MyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Momerandum Of Undestanding',
          style: TextStyle(
            fontFamily: 'Peanut Butter',
            // fontSize: 30,
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
      body: ListView.builder(
        itemCount: 25, // Ganti dengan jumlah kontak yang diinginkan
        itemBuilder: (BuildContext context, int index) {
          return DaftarDokumen(index: index);
        },
      ),
    );
  }
}

class DaftarDokumen extends StatelessWidget {
  final int index;

  const DaftarDokumen({required this.index});

  @override
  Widget build(BuildContext context) {
    // Contoh data kontak
    String judul = 'Judul Dokumen MOU $index';
    String detail = 'detail isi dokumen MOU $index';
    bool isActive = index % 2 == 0; // Contoh status aktif atau tidak aktif
    String tanggal = '15 Februari 2024'; // Contoh tanggal

    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.notes_rounded),
      ),
      title: Text(
        judul,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(detail),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Badge(
            isActive: isActive,
          ),
          SizedBox(height: 4),
          Text(
            tanggal,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}

class Badge extends StatelessWidget {
  final bool isActive;

  const Badge({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isActive ? 'Aktif' : 'Tidak Aktif',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
