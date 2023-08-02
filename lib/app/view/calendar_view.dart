// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:my_calendar/app/controller/calendar_controller.dart';
import 'package:my_calendar/app/view/memo_dialog.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';

import 'package:my_calendar/utils/table_util.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CalendarController());
    return Scaffold(
      body: TableCalendar(
        locale: 'ko-KR',
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: CalendarController.to.focusedDay.value,  // .value added here
        headerStyle: (const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        )),
        onDaySelected: (selectedDay, focusedDay) {
          CalendarController.to.setFocusedDay(focusedDay);
          CalendarController.to.setSelectedDay(selectedDay);
          showDialog(
            context: context,
            builder: (context) => const MemoDialog(),
          );
        },
        onPageChanged: (focusedDay) {
          CalendarController.to.setFocusedDay(focusedDay);
        },
      ),
    );
  }
}
