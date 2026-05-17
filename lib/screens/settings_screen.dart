// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:untitled/provider/my_app_provider.dart';
//
// import '../widgets/landuage_screen.dart';
// import '../widgets/theme_bottom_sheet.dart';
//
// class Settings extends StatelessWidget {
//   const Settings({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<AppProvider>(context);
//     return SafeArea(
//       child: Scaffold(
//
//         appBar: AppBar(
//           title: Text('Settings',style: TextStyle(
//             fontSize: 30,
//             color: Colors.black,
//           ),),
//         ),
//
//         body: Padding(
//           padding: const EdgeInsets.all(32.0),
//           child: Column(
//
//             children: [
//               Align(
//                  alignment: Alignment.topLeft,
//                   child: Text('language',style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   )),
//
//               SizedBox(height: 10,),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//
//                  padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                   ),
//                   child: Row(
//
//                     children: [
//                       Text('English',style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//
//                       ),),
//                       Spacer(),
//                       GestureDetector(
//                           onTap: (){
//                             LanguageThemeBottomSheet(context);
//                           },
//                           child: Icon(Icons.arrow_drop_down_outlined,
//                             color: Colors.black,
//                           )
//
//                       ),
//                     ],
//                   ),
//                 ),
//
//               ),
//
//               SizedBox(height: 20),
//               Align(
//                   alignment: Alignment.topLeft,
//                   child: Text('Mode',style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   )),
//
//               SizedBox(height: 10,),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                   ),
//                   child: Row(
//
//                     children: [
//                       Text('light',style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),),
//                       Spacer(),
//                       GestureDetector(
//                           onTap: (){
//                             showThemeBottomSheet(context);
//
//                           },
//                           child: Icon(Icons.arrow_drop_down_outlined,
//                             color: Colors.black,
//                           )),
//                     ],
//                   ),
//                 ),
//
//               ),
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
//    void showThemeBottomSheet(BuildContext context){
//     showModalBottomSheet(context: context, builder: (context) => const ThemeBottomSheet());
//
//    }
//   void LanguageThemeBottomSheet(BuildContext context){
//     showModalBottomSheet(context: context, builder: (context) => const LanguageBottomSheet());
//
//   }
// }
