import 'package:flutter/cupertino.dart';
import 'package:notes_app/res/responsive_layout.dart';
import 'package:notes_app/screens/layouts/task_mobile_layout.dart';
import 'package:notes_app/screens/layouts/task_tablet_layout.dart';
import 'package:notes_app/screens/layouts/task_website_layout.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileWidget: TaskMobileLayoutScreen(),
        tabletWidget: TaskTabletLayoutScreen(),
        websiteWidget: TaskWebsiteLayoutScreen());
  }
}
