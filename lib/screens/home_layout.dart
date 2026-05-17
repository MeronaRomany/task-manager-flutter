// import 'package:flutter/material.dart';
// import 'package:untitled/screens/settings_screen.dart';
// import 'package:untitled/screens/todo_screen.dart';
//
// import '../res/app_color.dart';
//
// class HomeLayout extends StatefulWidget {
//   const HomeLayout({super.key});
//
//   @override
//   State<HomeLayout> createState() => _HomeLayoutState();
// }
//
// class _HomeLayoutState extends State<HomeLayout> {
//    int index = 0;
//   List tab = [const Todo(),const Settings()];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: tab[index],
//       floatingActionButton: FloatingActionButton(onPressed: (){},
//         backgroundColor: AppColor.colormode,
//       child: const Icon(Icons.add,size: 30,),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: BottomAppBar(
//           height: 75,
//           notchMargin: 12.0,
//           shape: const CircularNotchedRectangle(),
//           child: BottomNavigationBar(
//
//             currentIndex: index,
//             onTap: (value){
//               setState(() {
//                 index = value;
//               });
//             },
//             items: [
//           BottomNavigationBarItem(
//
//               icon:Icon(Icons.list), label: '' ),
//
//           BottomNavigationBarItem(icon:Icon(Icons.settings), label: '' ),
//       ],),
//         ),
//     );
//   }
// }
