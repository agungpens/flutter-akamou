import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter_akamou/model/prodi/prodi_model.dart';

class ProdiController extends GetxController {
  var listProdi = <ProdiModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchListProdi();
    super.onInit();
  }

  Future<void> fetchListProdi() async {
    try {
      final response = await http.get(Uri.parse(
          'https://hello-ivy.id/AGUNG-MOU/public/api/prodi/getDataForMobile'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> dataList = jsonData['data'];

        // Clear previous data before adding new data
        listProdi.clear();

        // Loop through the data list and add ProdiModel objects to listProdi
        for (var item in dataList) {
          listProdi.add(
            ProdiModel(
              id: item['id'],
              namaProdi: item['nama_prodi'],
              keterangan: item['keterangan'] ?? "", // Handling null values
            ),
          );
        }

        isLoading.value = false; // Set isLoading to false when data is loaded
      } else {
        isLoading.value =
            false; // Ensure isLoading is set to false in case of error
        Get.snackbar('Error data loading!',
            'Server responded : ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      isLoading.value = false; // Set isLoading to false in case of error
      Get.snackbar('Error data loading!', 'Exception: $e');
    }
  }
}
