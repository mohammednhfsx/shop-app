import 'package:flutter/material.dart';

class AnimationFadeIn extends StatefulWidget {
  final double opacity;
  final Widget child;
  final Duration duration;
  final Curve curve;

  const AnimationFadeIn(
    RichText richText, {
    super.key,
    required this.opacity,
    required this.child,
    required this.duration,
    required this.curve,
  });

  @override
  State<AnimationFadeIn> createState() => _AnimationImageState();
}

class _AnimationImageState extends State<AnimationFadeIn> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // أول ما يفتح widget، بعد نصف ثانية يبدل قيمة opacity
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(seconds: 1), // مدة الأنيميشن
      curve: Curves.fastOutSlowIn, // شكل الحركة
    );
  }
}
