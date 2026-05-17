import 'package:flutter/material.dart';
import 'package:get_x/get.dart';


import '../main.dart';
import '../note.dart';

class TaskEdit extends StatelessWidget {
  final Note? note;

  TaskEdit({super.key, this.note});
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  if(note != null){
    titleController.text = note!.title;

  }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
          title: const Text("To Do List"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              child: Column(
                children: [
                  Text(
                    "Edit Task",
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                   TextField(
                  controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),

                  // const SizedBox(
                  //   height: 28,
                  // ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     "Select time",
                  //   ),
                  // ),
                  const SizedBox(
                    height: 115,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (titleController.text.isNotEmpty) {
                      var updateNote = Note(
                        noteId: note!.noteId, // مهم جدًا
                        title: titleController.text,
                        location: note!.location,
                      );

                       await database.noteDao.updateNote(updateNote);

                        Get.snackbar('success', 'valid update.');

                        Future.delayed(Duration(seconds: 2), () {
                          Get.back(result: updateNote);
                        });
                      }
                    },
                    child: Text(
                      "Save Changes",
                      // style: poppins18Bold(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}