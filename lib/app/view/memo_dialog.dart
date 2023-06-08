import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/calendar_controller.dart';

class MemoDialog extends StatelessWidget {
  const MemoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CalendarController());
    return Dialog(
      child: Column(
        children: [
          Title(color: Colors.black, child: Text(
            '${CalendarController.to.selectedDay?.year}-${CalendarController.to.selectedDay?.month}-${CalendarController.to.selectedDay?.day}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          const Text('memo list area'),
        ],
      ),
    );
  }
}
