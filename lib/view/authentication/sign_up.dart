// import 'package:e_comerce/view/authentication/login_screen.dart';
// import 'package:e_comerce/model/model/api_connection/api_connection.dart';
// import 'package:e_comerce/model/model/link/linkapi.dart';

// import 'package:e_comerce/view/screen/home.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final Api _api = Api();
//   bool _obscure = true;
//   final _formKey = GlobalKey<FormState>();
//   final namecontroller = TextEditingController();
//   final TextEditingController emailcontroller = TextEditingController();
//   final passowrdcontroller = TextEditingController();
//   bool isloading = false;

//   signup() async {
//     isloading = true;
//     setState(() {});
//     var response = await _api.postRequest(linkSignUp, {
//       "user_name": namecontroller.text,
//       "user_email": emailcontroller.text,
//       "user_password": passowrdcontroller.text
//     });
//     isloading = false;
//     setState(() {});
//     if (response['success'] == true) {
//       Get.offAll(() => const Home());
//     } else {
//       print("Signup failed: $response");
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
//                 "Sign up ",
//                 style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                 " Welcome to Shooping Marcket",
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
// //name textfield
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Container(
//                   height: 55,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.white,
//                     border: Border.all(color: Colors.white),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Center(
//                       child: TextFormField(
//                         controller: namecontroller,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'الرجاء إدخال الاسم';
//                           }
//                           if (value.length < 3) {
//                             return 'الاسم يجب أن يكون أطول من 3 أحرف';
//                           }
//                           return null;
//                         },
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'name',
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
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple, // لون البتن
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 18, horizontal: 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () async {
//                     await signup();
//                     if (_formKey.currentState!.validate()) {
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text("رجاءً تأكد من الحقول")),
//                       );
//                     }
//                   },
//                   child: const Text(
//                     "Sign up",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
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
//                     "Already have an Account?",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   TextButton(
//                     child: const Text(
//                       "Login",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     onPressed: () {
//                       Get.to(() => const LoginScreen());
//                     },
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
