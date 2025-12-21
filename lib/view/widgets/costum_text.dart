import 'package:flutter/material.dart';

class CostumText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;
  final Alignment alignment;

  const CostumText({
    super.key,
    required this.text,
    required this.fontsize,
    required this.color,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: fontsize, fontFamily: 'mondo'),
    );
  }
}
