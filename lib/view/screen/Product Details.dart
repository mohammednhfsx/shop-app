import 'package:e_comerce/controller/CartController.dart';
import 'package:e_comerce/controller/productController.dart';

import 'package:e_comerce/view/screen/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productdetails extends StatelessWidget {
  final controller = Get.put(Productcontroller());
  final dynamic data;
  bool isfavorite = false;
  Productdetails({super.key, required this.data});
  final Cartcontroller cartcontroller = Get.put(Cartcontroller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<Productcontroller>(
        builder: (controller) => AnimatedOpacity(
            opacity: controller.opacity,
            duration: const Duration(milliseconds: 300),
            child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 142, 50, 254),
              appBar: AppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 142, 50, 254),
                            borderRadius: BorderRadius.circular(20)),
                        child: IconButton(
                            onPressed: () {
                              Get.to(Cart());
                            },
                            icon: const Icon(
                              Icons.shopping_cart_checkout_sharp,
                              color: Colors.white,
                              size: 25,
                            )),
                      ),
                    ),
                  ),
                ],
                backgroundColor: const Color.fromARGB(255, 142, 50, 254),
                centerTitle: true,
                title: const Text(
                  "Product Details",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height,
                      child: Stack(
                        children: <Widget>[
                          // Container
                          Container(
                            margin: EdgeInsets.only(top: size.height * 0.3),
                            padding: EdgeInsets.only(
                                top: size.height * 0.12, left: 20),
                            height: 600,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(24),
                                    topLeft: Radius.circular(24))),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Color",
                                          ),
                                          Row(
                                            children: [
                                              ColorDot(
                                                color: Color(0xff356c95),
                                                isSelected: true,
                                              ),
                                              ColorDot(
                                                color: Color.fromARGB(
                                                    255, 227, 30, 116),
                                              ),
                                              ColorDot(
                                                color: Color.fromARGB(
                                                    255, 2, 8, 12),
                                              ),
                                              ColorDot(
                                                color: Color.fromARGB(
                                                    255, 1, 177, 83),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    //size prodect
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Size",
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                " 12",
                                                style: TextStyle(
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 100, 100, 100),
                                                ),
                                              ),
                                              Text(
                                                " cm",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 100, 100, 100),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                //descrption prodect
                                AnimatedOpacity(
                                  opacity: controller
                                      .opacity, // حطها 0.0 بالـ init وبعدين غيرها لـ 1.0
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn,
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      data['descrption'],
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 100, 100, 100),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                                ),
                                //  counter add and remove numder
                                GetBuilder<Productcontroller>(
                                  init: Productcontroller(),
                                  builder: (controller) => Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.increment();
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: const Color.fromARGB(
                                                      255, 25, 23, 23))),
                                          child: const Icon(Icons.add),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "   ${controller.countre}",
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (controller.countre > 1) {
                                            return controller.Decrement();
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.zero,
                                          height: 32,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: const Color.fromARGB(
                                                      255, 131, 131, 131))),
                                          child: const Icon(Icons.remove),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Buttom buy and favorite
                                SizedBox(
                                  height: size.height * 0.1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          controller.isfavorite;
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: isfavorite
                                              ? Colors.pink
                                              : Colors.grey[300],
                                          size: 50,
                                        )),
                                    InkWell(
                                      onTap: () {
                                        cartcontroller.addcart(data);
                                        Get.to(Cart());
                                      },
                                      child: AnimatedOpacity(
                                        opacity: controller
                                            .opacity, // حطها 0.0 بالـ init وبعدين غيرها لـ 1.0
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.fastOutSlowIn,
                                        child: Container(
                                          height: 66,
                                          width: 290,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 142, 50, 254),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            " add to Cart",
                                            style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                          //name prodect
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['name'],
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                //price prodect
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.1, left: 25),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          AnimatedOpacity(
                                            opacity: controller
                                                .opacity, // حطها 0.0 بالـ init وبعدين غيرها لـ 1.0
                                            duration:
                                                const Duration(seconds: 1),
                                            curve: Curves.fastOutSlowIn,
                                            child: RichText(
                                              textAlign: TextAlign.start,
                                              text: const TextSpan(
                                                text: "Price",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 254, 254, 254)),
                                              ),
                                            ),
                                          ),
                                          AnimatedOpacity(
                                            opacity: controller
                                                .opacity, // حطها 0.0 بالـ init وبعدين غيرها لـ 1.0
                                            duration:
                                                const Duration(seconds: 1),
                                            curve: Curves.fastOutSlowIn,
                                            child: RichText(
                                                text: TextSpan(
                                              text: data['price'],
                                              style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 254, 254, 254)),
                                            )),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Expanded(
                                        child: AnimatedOpacity(
                                            opacity: controller
                                                .opacity, // حطها 0.0 بالـ init وبعدين غيرها لـ 1.0
                                            duration:
                                                const Duration(seconds: 1),
                                            curve: Curves.fastOutSlowIn,
                                            child: Image.asset(data['image'])),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    super.key,
    required this.color,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.5),
      margin: const EdgeInsets.all(3),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? color : Colors.transparent)),
      child: DecoratedBox(
          decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      )),
    );
  }
}
