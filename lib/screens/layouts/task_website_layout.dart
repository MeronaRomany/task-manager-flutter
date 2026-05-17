import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:notes_app/res/app_colors.dart';
import 'package:notes_app/screens/task_edit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import '../../note.dart';
import '../../widgets/task_item.dart';

class TaskWebsiteLayoutScreen extends StatefulWidget {
  const TaskWebsiteLayoutScreen({super.key});

  @override
  State<TaskWebsiteLayoutScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TaskWebsiteLayoutScreen> {
  RxList notes = [].obs;

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {
    List<Note> data = await database.noteDao.getAllNotes();
    notes.assignAll(data); // يحوّل
  }

  @override
  Widget build(BuildContext context) {
    loadNotes();
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Get.toNamed("/AddNote");

        },
        child: Text("Add Note"),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        title: const Text('To Do List'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(() {
                return Expanded(
                  child: GridView.builder(
                    itemCount: notes.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3,
                  ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () async {
                        Note? updatedNote = await Get.to(() => TaskEdit(note: notes[index]));
                        if (updatedNote != null) {
                          int i = notes.indexWhere((n) => n.noteId == updatedNote.noteId);
                          if (i != -1) {
                            notes[i] = updatedNote;
                          }
                        }
                      },
                      child: TaskItem(
                        onLocation: (location) {
                          final latLng = location.split(",");
                          final url =
                              "https://www.google.com/maps/search/?api=1&query=${latLng[0]},${latLng[1]}";
                          launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                        },
                        titleNote: notes[index].title,
                        locationNote: notes[index].location,
                        deleteItem: ()async{
                          await database.noteDao.deleteNote(notes[index]);
                          notes.removeAt(index);
                        },
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
