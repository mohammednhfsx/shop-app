import 'package:e_comerce/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // 👈 تأكد أنك أضفت هذه الحزمة في pubspec.yaml

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 4), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Home()),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 50, 254),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // حركة الشعار
            AnimatedBuilder(
              animation: _logoAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _logoAnimation.value,
                  child: Transform.scale(
                    scale: _logoAnimation.value * 1.2,
                    child: const Icon(
                      Icons.shopping_bag_rounded,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 60),

            // 👇 هنا أضفنا تأثير WavyAnimatedText بدلاً من النص الثابت
            FadeTransition(
              opacity: _logoAnimation,
              child: Column(
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 36.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('Smile Shop'),
                      ],
                      isRepeatingAnimation: true,
                      onTap: () {
                        debugPrint("Splash Text Tapped");
                      },
                    ),
                  ),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        BounceAnimatedText('By Mohamed Al-Mahdi'),
                        BounceAnimatedText('version  1.0.0'),
                      ],
                      isRepeatingAnimation: false,
                      onTap: () {
                        debugPrint("Splash Text Tapped");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
