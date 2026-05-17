import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_x/get_navigation/get_navigation.dart';
import 'package:notes_app/screens/add_note.dart';
import 'package:notes_app/screens/task.dart';
import 'package:notes_app/screens/task_edit.dart';

import 'note_database.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDatabase();
  runApp(DevicePreview(
    enabled: true,
      builder: (BuildContext context)=>MyApp() ,
  )

      );
}

Future<void> initDatabase() async {
  
  String dbPath='notes.db';
   database = await $FloorNoteDatabase.databaseBuilder(dbPath).build();
}
late final NoteDatabase database;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
       initialRoute: "/Task",
      getPages: [
        GetPage(name: "/Task", page: ()=>Task()),

        GetPage(name: "/TaskEditScreen", page: ()=>TaskEdit()),
        GetPage(name: "/AddNote", page: ()=>AddNote()),

      ],
    );
  }
}

