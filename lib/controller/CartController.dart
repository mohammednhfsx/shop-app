import 'package:e_comerce/model/model/prodect.dart';
import 'package:get/get.dart';

class Cartcontroller extends GetxController {
  var cartitem = <prodect>[].obs;

// void addcart
  void addcart(Map<String, dynamic> data) {
    final priceString = data['price']?.toString() ?? '0';
    final price =
        double.tryParse(priceString.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;

    final product = prodect(
      data['id'],
      data['name'],
      price,
      data['image'],
    );
    cartitem.add(product);
  }

  //void deletcart
  void deletFromCart(prodect product) {
    cartitem.remove(product);
  }

  // Totalprice
  double get totalprice =>
      cartitem.fold<double>(0.0, (sum, item) => sum + item.price);
}
