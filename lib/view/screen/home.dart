import 'package:e_comerce/view/widgets/costum_text.dart';
import 'package:e_comerce/view/widgets/coustum_butt_Nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_comerce/view/widgets/lists.dart';
import 'package:e_comerce/view/widgets/slider_carousel.dart';
import 'package:e_comerce/view/screen/Product%20Details.dart';
import 'package:e_comerce/view/screen/search.dart';
import 'package:e_comerce/view/screen/setting_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  int _selectedIndex = 0;
  int selectedContainre = 0;

  final List<Widget> _pages = const [
    Center(child: Text("Home  ", style: TextStyle(fontSize: 22))),
    Center(child: Text("Cart", style: TextStyle(fontSize: 22))),
    Center(child: Text("Setting", style: TextStyle(fontSize: 22))),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: _buildDrawer(),
      // appBar: _buildAppBar(),
      bottomNavigationBar: CustomNavBar(
        onTabSelected: _onTabSelected,
        currentIndex: _selectedIndex,
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 600;
          final isweb = constraints.maxWidth > 1000;
          final iswide = isTablet || isweb;

          return SingleChildScrollView(
            child: Column(
              children: [
                _buildAppBar(),
                const SizedBox(height: 10),
                _buildSearchBar(),
                const SizedBox(height: 15),
                const SliderCarousel(),
                const SizedBox(height: 20),
                _buildCategoryIcons(),
                const SizedBox(height: 10),
                _buildSectionTitle("خصيصا لك"),
                const SizedBox(height: 10),
                _buildProductList(),
                const SizedBox(height: 30),
                _buildSectionTitle("الأكثر مبيعاً"),
                const SizedBox(height: 10),
                _buildProductList(),
              ],
            ),
          );
        }),
      ),
    );
  }

  // ============================ _buildAppBar ============================

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CostumText(
            text: "ShopAi",
            color: Color.fromARGB(255, 142, 50, 254),
            alignment: Alignment.center,
            fontsize: 25,
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 196, 235, 249),
                  shape: BoxShape.circle),
              child: const Image(
                  image: AssetImage("assets/icons8-person-48.png"))),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

//=================Drawer==================================================
  Drawer _buildDrawer() {
    return Drawer(
      backgroundColor: const Color.fromARGB(90, 255, 255, 255),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40),
        children: [
          const Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      "assets/WhatsApp Image 2025-09-25 at 09.05.01_acd31299.jpg"),
                ),
                SizedBox(height: 10),
                Text(
                  "مرحبا بك ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          _drawerItem(
              "Setting", Icons.settings, () => Get.to(const SettingsPage())),
          _drawerItem("cart", Icons.shopping_cart, () {}),
          _drawerItem("Acount", Icons.account_circle, () {}),
          _drawerItem("About", Icons.question_mark_outlined, () {}),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      focusColor: const Color(0xFFC20A0A),
      onLongPress: () {},
      leading: Icon(icon, color: const Color.fromARGB(255, 244, 247, 250)),
      title: Text(title,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      onTap: onTap,
    );
  }

//===============_buildSearchBar===================================================
  Widget _buildSearchBar() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
            onTap: () {
              showSearch(
                context: context,
                delegate:
                    ProductSearchDelegate(product.cast<Map<String, dynamic>>()),
              );
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 48,
                    width: 290,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(
                          "search..",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontFamily: 'gbbkxud'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 142, 50, 254),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      height: 48,
                      width: 60,
                      child: const Image(
                          image: AssetImage("assets/icons8-filter-30.png")))
                ])));
  }

  Widget _buildCategoryIcons() {
    List nameicons = [
      {
        "image": "assets/suitcase.png",
        "name": "luggage",
      },
      {
        "image": "assets/headphone.png",
        "name": "headphones",
      },
      {
        "image": "assets/apple.png",
        "name": "apple",
      },
      {
        "image": "assets/woman.png",
        "name": "woman",
      },
      {
        "image": "assets/profile.png",
        "name": "man",
      },
      {
        "image": "assets/woman.png",
        "name": "woman",
      },
      {
        "image": "assets/profile.png",
        "name": "man",
      },
      {
        "image": "assets/woman.png",
        "name": "woman",
      },
      {
        "image": "assets/profile.png",
        "name": "man",
      },
      {
        "image": "assets/woman.png",
        "name": "woman",
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // 👇 نتحقق من حجم الشاشة الحالي
          if (constraints.maxWidth < 600) {
            // 📱 موبايل → صف أفقي قابل للتمرير
            return SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nameicons.length,
                itemBuilder: (context, i) {
                  bool isSelected = selectedContainre == i;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedContainre = i;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.10),
                                  blurRadius: 6,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(
                                nameicons[i]["name"],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'gbbkxud',
                                  color: isSelected
                                      ? const Color.fromARGB(255, 142, 50, 254)
                                      : Colors.grey[500],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            // 💻 شاشة كبيرة → شبكة تلقائية (Grid)
            int crossAxisCount =
                (constraints.maxWidth / 150).floor(); // عدد الأعمدة حسب العرض
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: nameicons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 1,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Image.asset(
                        nameicons[i]["image"],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      nameicons[i]["name"],
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CostumText(
            text: "Popular",
            fontsize: 25,
            color: Colors.black,
            alignment: Alignment.topRight,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 142, 50, 254),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 0,
            ),
            onPressed: () {},
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: CostumText(
                  text: "veiw all ",
                  fontsize: 17,
                  color: Colors.white,
                  alignment: Alignment.topLeft,
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // 📱 موبايل → Scroll أفقي
          return SizedBox(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: product.length,
              itemBuilder: (context, index) {
                return SlideTransition(
                  position: _animation,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(Productdetails(data: product[index]));
                    },
                    child: Container(
                      width: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.10),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        color: const Color.fromARGB(255, 254, 249, 255),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                product[index]['image'],
                                height: 130,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Text(
                              product[index]['name'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Text(
                                product[index]['price'],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          // 💻 شاشة كبيرة → شبكة Grid تلقائية
          int crossAxisCount =
              (constraints.maxWidth / 250).floor(); // عدد الأعمدة
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: product.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.65,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return SlideTransition(
                position: _animation,
                child: GestureDetector(
                  onTap: () {
                    Get.to(Productdetails(data: product[index]));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(21, 17, 2, 2),
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              product[index]['image'],
                              height: 180,
                              // width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          child: Text(
                            product[index]['descrption'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text(
                              product[index]['price'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[700],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
