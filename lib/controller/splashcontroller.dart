import 'dart:async';

import 'package:e_comerce/view/screen/home.dart';
import 'package:get/get.dart';

class Splashcontroller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      Get.off(() => const Home());
    });
  }
}
