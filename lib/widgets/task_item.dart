import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_x/get.dart';

import '../res/app_colors.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    required this.titleNote,
    required this.locationNote,
    required this.deleteItem,
    required this.onLocation,
  });

  final String titleNote;
  final String? locationNote;
  final Future<void> Function()? deleteItem;
  final void Function(String location)? onLocation;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // قياسات نسبية بدل الثابتة
    final barHeight = screenHeight * 0.08; // بدل 65
    final barWidth = screenWidth * 0.015; // بدل 6
    final doneButtonWidth = screenWidth * 0.15; // بدل 69
    final doneButtonHeight = screenHeight * 0.045; // بدل 34
    final paddingRightDone = screenWidth * 0.05; // بدل 20
    final doneTextPaddingH = screenWidth * 0.07; // بدل 30
    final doneTextPaddingV = screenHeight * 0.05; // بدل 42

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.015, // بدل 5
        vertical: screenHeight * 0.01, // بدل 8
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.4,
          children: [
            SlidableAction(
              onPressed: (context) => _showDeleteDialog(context),
              icon: Icons.delete,
              label: 'Delete',
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => Get.toNamed("/TaskEditScreen"),
              label: 'Edit',
              icon: Icons.edit,
              backgroundColor: Colors.greenAccent,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Card(
          margin: EdgeInsets.zero,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.025,
                  vertical: screenHeight * 0.015,
                ),
                height: barHeight,
                width: barWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: isDone ? AppColors.lightGreen : AppColors.blue,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.titleNote,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        // style: poppins18Bold(),
                      ),
                    ),
                    if (widget.locationNote != null)
                      IconButton(
                        icon: const Icon(Icons.location_on, color: Colors.red),
                        onPressed: () {
                          widget.onLocation?.call(widget.locationNote!);
                        },
                      ),
                  ],
                ),
              ),
              isDone == false
                  ? Padding(
                padding: EdgeInsets.only(right: paddingRightDone),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isDone = true;
                    });
                  },
                  child: Container(
                    width: doneButtonWidth,
                    height: doneButtonHeight,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
                  : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: doneTextPaddingH,
                  vertical: doneTextPaddingV,
                ),
                child: const Text(
                  "Done!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext dialogContext) {
    showDialog(
      context: dialogContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Do you want to delete this task?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                if (widget.deleteItem != null) {
                  await widget.deleteItem!();
                }
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}