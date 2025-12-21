import 'package:e_comerce/view/screen/cart.dart';
import 'package:e_comerce/view/screen/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CustomNavBar extends StatefulWidget {
  final Function(int) onTabSelected;
  final int currentIndex;

  const CustomNavBar({
    super.key,
    required this.onTabSelected,
    required this.currentIndex,
  });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: const Color.fromARGB(255, 142, 50, 254),
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      child: NavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        selectedIndex: widget.currentIndex,
        onDestinationSelected: widget.onTabSelected,
        destinations: [
          NavigationDestination(
            icon: InkWell(
                onTap: () {
                  // Get.to(const Home());
                },
                child: const Icon(Icons.home_outlined)),
            selectedIcon: const Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          NavigationDestination(
            icon: InkWell(
                onTap: () {
                  Get.to(Cart());
                },
                child: const Icon(Icons.shopping_cart_outlined)),
            selectedIcon: const Icon(Icons.shopping_cart, color: Colors.white),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: InkWell(
                onTap: () {
                  Get.to(const SettingsPage());
                },
                child: const Icon(Icons.settings_outlined)),
            selectedIcon: const Icon(Icons.settings, color: Colors.white),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
