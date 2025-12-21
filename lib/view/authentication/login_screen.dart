// import 'package:e_comerce/view/authentication/sign_up.dart';
// import 'package:e_comerce/model/model/api_connection/api_connection.dart';
// import 'package:e_comerce/model/model/link/linkapi.dart';
// import 'package:e_comerce/view/screen/home.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool _obscure = true;
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailcontroller = TextEditingController();
//   final passowrdcontroller = TextEditingController();
//   bool isloading = false;
//   final Api __api = Api();

//   login() async {
//     isloading = true;
//     setState(() {});
//     if (_formKey.currentState!.validate()) {
//       try {
//         var response = await __api.postRequest(linkLogin, {
//           "user_email": emailcontroller.text,
//           "user_password": passowrdcontroller.text
//         });

//         if (response != null && response['success'] == true) {
//           Get.offAll(() => const Home());
//         } else {
//           print("login failed: $response");
//         }
//       } catch (e) {
//         print("Error parsing response: $e");
//       }
//     }

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//         ),
//         backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//         body: SafeArea(
//             child: Center(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // icon
//                 const Icon(
//                   Icons.shopify_outlined,
//                   size: 100,
//                 ),

//                 //Hello again!
//                 const Text(
//                   "Hello agian!",
//                   style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   " Welcome back, you're been missed!!,",
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey),
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),

//                 //email textfield
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Container(
//                     height: 55,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         color: Colors.white,
//                         border: Border.all(color: Colors.white)),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Center(
//                         child: TextFormField(
//                           controller: emailcontroller,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'الرجاء إدخال البريد الإلكتروني';
//                             }
//                             // regex بسيط للتحقق من شكل الايميل
//                             if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
//                                 .hasMatch(value)) {
//                               return 'البريد الإلكتروني غير صالح';
//                             }
//                             return null;
//                           },
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'Email',
//                             hintStyle: TextStyle(color: Colors.grey),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),

//                 //password textfield

//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Container(
//                     height: 55,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         color: Colors.white,
//                         border: Border.all(color: Colors.white)),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Center(
//                         child: TextFormField(
//                           obscureText: _obscure,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'الرجاء إدخال كلمة المرور';
//                             } else if (value.length < 8) {
//                               return 'كلمة المرور يجب أن تكون على الأقل 8 أحرف';
//                             } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
//                               return 'يجب أن تحتوي على حرف كبير واحد على الأقل';
//                             } else if (!RegExp(r'[0-9]').hasMatch(value)) {
//                               return 'يجب أن تحتوي على رقم واحد على الأقل';
//                             } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
//                               return 'يجب أن تحتوي على رمز خاص واحد على الأقل (!@#\$&*~)';
//                             }
//                             return null;
//                           },
//                           controller: passowrdcontroller,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'password',
//                             hintStyle: const TextStyle(color: Colors.grey),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 _obscure
//                                     ? Icons.visibility_off
//                                     : Icons.visibility,
//                                 color: Colors.grey,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _obscure = !_obscure;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),

//                 // button sign in
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: InkWell(
//                     onTap: () {
//                       // if (_formKey.currentState!.validate()) {
//                       //   // ✅ الحقول صحيحة – تقدر تسوي API call هنا
//                       //   ScaffoldMessenger.of(context).showSnackBar(
//                       //     SnackBar(
//                       //       content: const Text("تسجيل الدخول..."),
//                       //       backgroundColor: Color(Colors.deepPurple as int),
//                       //     ),
//                       //   );
//                       // }
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                           color: const Color(0xffF83758),
//                           borderRadius: BorderRadius.circular(12)),
//                       child: const Center(
//                           child: Text(
//                         "sign in",
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       )),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),

//                 // not account? register now
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Not Account?",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     TextButton(
//                       child: const Text(
//                         "Register now",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const SignUp()));
//                       },
//                     )
//                   ],
//                 ),

//                 const Text(
//                   "or",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Are You an admin ?",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     TextButton(
//                       child: const Text(
//                         " Click Hear",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       onPressed: () {},
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         )),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey[300],
//       ),
//       backgroundColor: Colors.grey[300],
//       body: SafeArea(
//           child: Center(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // icon
//               const Icon(
//                 Icons.shopify_outlined,
//                 size: 100,
//               ),

//               //Hello again!
//               const Text(
//                 "Hello agian!",
//                 style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                 " Welcome back, you're been missed!!,",
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),

//               //email textfield
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Container(
//                   height: 55,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.white,
//                       border: Border.all(color: Colors.white)),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Center(
//                       child: TextFormField(
//                         controller: emailcontroller,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'الرجاء إدخال البريد الإلكتروني';
//                           }
//                           // regex بسيط للتحقق من شكل الايميل
//                           if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                             return 'البريد الإلكتروني غير صالح';
//                           }
//                           return null;
//                         },
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Email',
//                           hintStyle: TextStyle(color: Colors.grey),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),

//               //password textfield

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Container(
//                   height: 55,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.white,
//                       border: Border.all(color: Colors.white)),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Center(
//                       child: TextFormField(
//                         obscureText: _obscure,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'الرجاء إدخال كلمة المرور';
//                           } else if (value.length < 8) {
//                             return 'كلمة المرور يجب أن تكون على الأقل 8 أحرف';
//                           } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
//                             return 'يجب أن تحتوي على حرف كبير واحد على الأقل';
//                           } else if (!RegExp(r'[0-9]').hasMatch(value)) {
//                             return 'يجب أن تحتوي على رقم واحد على الأقل';
//                           } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
//                             return 'يجب أن تحتوي على رمز خاص واحد على الأقل (!@#\$&*~)';
//                           }
//                           return null;
//                         },
//                         controller: passowrdcontroller,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'password',
//                           hintStyle: const TextStyle(color: Colors.grey),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _obscure
//                                   ? Icons.visibility_off
//                                   : Icons.visibility,
//                               color: Colors.grey,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _obscure = !_obscure;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),

//               // button sign in
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: InkWell(
//                   onTap: () async {
//                     await login();
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                         color: Colors.deepPurple,
//                         borderRadius: BorderRadius.circular(12)),
//                     child: const Center(
//                         child: Text(
//                       "sign in",
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     )),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),

//               // not account? register now
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Not Account?",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   TextButton(
//                     child: const Text(
//                       "Register now",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SignUp()));
//                     },
//                   )
//                 ],
//               ),

//               const Text(
//                 "or",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Are You an admin ?",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   TextButton(
//                     child: const Text(
//                       " Click Hear",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     onPressed: () {},
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
