import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get_x/get.dart';
import 'package:notes_app/note.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import 'package:geolocator/geolocator.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController titleController = TextEditingController();
 late final Note note;

  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 120.0,right: 8,left: 8),
          child: SizedBox(
            height: 300,
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                child: Column(
                  spacing: 30,
                  children: [
                    Text("Add Task",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),

                        Expanded(
                          child: TextFormField(
                            controller: titleController,
                            decoration: InputDecoration(
                              hintText: 'Title',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder:OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(),
                            ),
                          ),
                        ),


                            Checkbox(
                              value: isCheck,
                              onChanged: (v) {
                                setState(() {
                                  isCheck = v!;
                                });
                              },
                            ),



                    ElevatedButton(
                      onPressed: () async {
                        String? locationValue;

                        if (isCheck) {
                          locationValue = await getLocationFromAddress(titleController.text);
                        }

                        var note = Note(
                          title: titleController.text,
                          location: locationValue,
                        );

                        if (titleController.text.isNotEmpty) {
                          // حفظ النوت واسترجاع id
                          int insertedId = await database.noteDao.insertNote(note);
                          note = Note(noteId: insertedId, title: note.title, location: note.location);

                          Get.snackbar('Success', 'Note saved successfully.');

                          if (isCheck && locationValue == null) {
                            try {
                              final updatedLocation = await getLocationFromAddress(titleController.text);
                              if (updatedLocation != null) {
                                note.location = updatedLocation;
                                await database.noteDao.updateNote(note);
                              }
                            } catch (_) {}
                          }

                          Future.delayed(const Duration(seconds: 2), () {
                            Get.back();
                          });
                        } else {
                          Get.snackbar('Error', 'Please, enter a valid note');
                        }
                      },
                      child: const Text(
                        "Save Changes",
                        style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
               ]),
                ),
              ),
            ),
          ),
        ),

    );
  }

  Future<String?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Error", "Location services are disabled");
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Error", "Location permission denied");
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Error", "Permission permanently denied");
      return null;
    }
    final location = await locationFromAddress(titleController.text);
    final url = Uri.parse(
        "https://www.google.com/maps/search/?api=1"
            "&query=${location.first.latitude},${location.first.longitude}"
    );
    // final url = Uri.parse(
    //     "geo:0,0?q=${nearestStation.value?.latitude},${nearestStation.value?.longitude}(${nearestStation.value!.englishName}"
    // );
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );

    return "${location.first.latitude},${location.first.longitude}";
  }
  Future<String?> getLocationFromAddress(String address) async {
    try {
      final locations = await locationFromAddress(address);

      return "${locations.first.latitude},${locations.first.longitude}";
    } catch (e) {
      Get.snackbar(
        "Info",
        "Could not get location from address.",
      );
      return null;
    }
  }
}
