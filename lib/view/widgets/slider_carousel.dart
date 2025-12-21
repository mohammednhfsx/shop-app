import 'package:flutter/material.dart';

class SliderCarousel extends StatefulWidget {
  const SliderCarousel({super.key});

  @override
  State<SliderCarousel> createState() => _SliderCarouselState();
}

class _SliderCarouselState extends State<SliderCarousel> {
  final List<String> imgList = [
    "assets/d214bbe85aadaaf6378ee7fc3c1c25b5.jpg",
    "assets/6a47273d5af5cc4e4d0f697ad5e9552d.jpg",
    "assets/d214bbe85aadaaf6378ee7fc3c1c25b5.jpg",
    "assets/bgy.jpg"
  ];

  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isTablet = constraints.maxWidth > 600;
      final isweb = constraints.maxWidth > 1000;
      final iswide = isTablet || isweb;

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 150,
            child: PageView.builder(
              controller: _pageController,
              itemCount: imgList.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      imgList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          //dot
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? const Color.fromARGB(255, 142, 50, 254)
                      : Colors.grey[300],
                ),
              );
            }).toList(),
          ),
        ],
      );
    });
  }
}
