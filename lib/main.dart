import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calendar/app/view/calendar_view.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: CalendarView(),
    );
  }
}
