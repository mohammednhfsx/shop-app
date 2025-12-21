import 'package:get/get.dart';

class Productcontroller extends GetxController {
  int countre = 0;
  double opacity = 0.0;
  bool isfavorite = false;

  void increment() {
    countre++;
    update();
  }

  void Decrement() {
    countre--;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 300), () {
      opacity = 1.0;
      update();
    });
  }

  Favorite() {
    isfavorite = !isfavorite;
    update();
  }
}
