import 'dart:html';

import 'package:flutter/material.dart';

class MemoDialog extends StatelessWidget {
  final DateTime selectedDay;
  MemoDialog({required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Title(color: Colors.black, child: Text(
            '${selectedDay.year}-${selectedDay.month}-${selectedDay.day}',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          Text('memo list area'),
        ],
      ),
    );
  }
}
