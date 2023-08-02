import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calendar/app/controller/calendar_controller.dart';
import 'package:my_calendar/utils/db_mamager.dart';
import 'package:my_calendar/app/model/memo.dart';

class MemoDialog extends StatefulWidget {
  const MemoDialog({super.key});

  @override
  _MemoDialogState createState() => _MemoDialogState();
}

class _MemoDialogState extends State<MemoDialog> {
  final _titleController = TextEditingController();
  final _detailController = TextEditingController();

  List<Memo> memos = [];

  @override
  void initState() {
    super.initState();
    fetchMemos();
  }

  fetchMemos() async {
    if (CalendarController.to.selectedDay.value != null) {
      DbManager dbManager = DbManager();
      memos = await dbManager.select(CalendarController.to.selectedDay.value!);
      setState(() {});  // Update the UI
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Text(
            '${CalendarController.to.selectedDay.value?.year}-${CalendarController.to.selectedDay.value?.month}-${CalendarController.to.selectedDay.value?.day}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: _detailController,
            decoration: const InputDecoration(
              labelText: 'Detail',
            ),
          ),
          for (var memo in memos)
            Text("Title: ${memo.title}, Detail: ${memo.detail}"),
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline,
              color: Colors.black,
              size: 24.0,
            ),
            onPressed: () async {
              String title = _titleController.text;
              String detail = _detailController.text;
              DateTime? selectedDate = CalendarController.to.selectedDay.value;

              if (selectedDate != null) {
                Memo newMemo = Memo(
                  title: title,
                  detail: detail,
                  date: selectedDate,
                );

                DbManager dbManager = DbManager();  // Get the singleton instance
                await dbManager.insert(newMemo.toJson());

                Get.back();  // close the dialog
              } else {
                print('Error: selected day is null');
              }
            },
          ),
        ],
      ),
    );
  }
}
