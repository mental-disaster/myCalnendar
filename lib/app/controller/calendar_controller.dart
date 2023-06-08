import 'package:get/get.dart';

class CalendarController extends GetxController {
  static CalendarController get to => Get.find();

  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
}