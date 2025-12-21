import 'package:e_comerce/view/screen/Product%20Details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  final List<Map<String, dynamic>> products;
  const Search(
    this.products, {
    super.key,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search Products",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
        actions: [
          IconButton(
            onPressed: () {
              // 🔍 هنا يتم فتح واجهة البحث
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(widget.products),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Image(image: AssetImage("assets/question.png")),
        ),
      ),
    );
  }
}

/// 🔍 هذا هو كلاس البحث الحقيقي للمنتجات
class ProductSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> products;

  ProductSearchDelegate(this.products);

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            query = ''; // يمسح النص المكتوب
          },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(context, null); // رجوع
        },
        icon: const Icon(Icons.arrow_back),
      );

  // 🔸 النتائج بعد الضغط على "بحث"
  @override
  Widget buildResults(BuildContext context) {
    final results = products.where((item) {
      final name = item['name'].toString().toLowerCase();
      final desc = item['descrption'].toString().toLowerCase();
      final search = query.toLowerCase();
      return name.contains(search) || desc.contains(search);
    }).toList();

    return _buildProductList(results);
  }

  // 🔹 الاقتراحات أثناء الكتابة
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products.where((item) {
      final name = item['name'].toString().toLowerCase();
      final search = query.toLowerCase();
      return name.startsWith(search);
    }).toList();

    return _buildProductList(suggestions);
  }

  // 🔸 بناء واجهة عرض المنتجات
  Widget _buildProductList(List<Map<String, dynamic>> items) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          "😔 لا توجد نتائج مطابقة",
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item['image'],
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              item['name'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(item['price']),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Get.to(Productdetails(data: item)); // يفتح صفحة التفاصيل
            },
          ),
        );
      },
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:e_commerce/models/product.dart';
// import 'package:nowa_runtime/nowa_runtime.dart';
// import 'package:e_commerce/globals/app_state.dart';
// import 'package:e_commerce/pages/cart_page.dart';
// import 'package:e_commerce/components/product_card.dart';

// @NowaGenerated()
// class SearchPage extends StatefulWidget {
//   @NowaGenerated({'loader': 'auto-constructor'})
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() {
//     return _SearchPageState();
//   }
// }

// @NowaGenerated()
// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController _searchController = TextEditingController();

//   List<Product> _filteredProducts = [];

//   String _searchQuery = '';

//   @override
//   void initState() {
//     super.initState();
//     final appState = AppState.of(context, listen: false);
//     _filteredProducts = appState.products;
//   }

//   void _filterProducts(String query) {
//     final appState = AppState.of(context, listen: false);
//     setState(() {
//       _searchQuery = query;
//       if (query.isEmpty) {
//         _filteredProducts = appState.products;
//       } else {
//         _filteredProducts = appState.products
//             .where(
//               (product) =>
//                   product.name.toLowerCase().contains(query.toLowerCase()) ||
//                   product.category.toLowerCase().contains(
//                     query.toLowerCase(),
//                   ) ||
//                   product.description.toLowerCase().contains(
//                     query.toLowerCase(),
//                   ),
//             )
//             .toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appState = AppState.of(context);
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black87,
//         title: const Text(
//           'Search Products',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//         actions: [
//           Stack(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.shopping_cart_outlined),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const CartPage()),
//                   );
//                 },
//               ),
//               if (appState.cartItemCount > 0)
//                 Positioned(
//                   right: 8,
//                   top: 8,
//                   child: Container(
//                     padding: const EdgeInsets.all(2),
//                     decoration: const BoxDecoration(
//                       color: Colors.red,
//                       shape: BoxShape.circle,
//                     ),
//                     constraints: const BoxConstraints(
//                       minWidth: 16,
//                       minHeight: 16,
//                     ),
//                     child: Text(
//                       '${appState.cartItemCount}',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 10,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16),
//             color: Colors.white,
//             child: TextField(
//               controller: _searchController,
//               onChanged: _filterProducts,
//               decoration: InputDecoration(
//                 hintText: 'Search products...',
//                 prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                 suffixIcon: _searchQuery.isNotEmpty
//                     ? IconButton(
//                         icon: const Icon(Icons.clear),
//                         onPressed: () {
//                           _searchController.clear();
//                           _filterProducts('');
//                         },
//                       )
//                     : null,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: Colors.grey[300]!),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: const BorderSide(color: Colors.blue),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 12,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: _filteredProducts.isEmpty
//                 ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.search_off,
//                           size: 80,
//                           color: Colors.grey[400],
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           _searchQuery.isEmpty
//                               ? 'Start typing to search products'
//                               : 'No products found',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.grey[600],
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         if (_searchQuery.isNotEmpty)
//                           Text(
//                             'Try searching for something else',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey[500],
//                             ),
//                           ),
//                       ],
//                     ),
//                   )
//                 : GridView.builder(
//                     padding: const EdgeInsets.all(16),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 16,
//                           mainAxisSpacing: 16,
//                           childAspectRatio: 0.75,
//                         ),
//                     itemCount: _filteredProducts.length,
//                     itemBuilder: (context, index) {
//                       final product = _filteredProducts[index];
//                       return ProductCard(product: product);
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
// }
