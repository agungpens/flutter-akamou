import 'package:flutter_akamou/controller/prodi/prodi_controller.dart';
import 'package:get/get.dart';

class ProdiControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdiController>(() => ProdiController());
  }
}
