import 'package:get/get.dart';

class CalendarController extends GetxController {
  static CalendarController get to => Get.find();

  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> selectedDay = Rx<DateTime?>(null);

  void setFocusedDay(DateTime date) {
    focusedDay.value = date;
  }

  void setSelectedDay(DateTime? date) {
    selectedDay.value = date;
  }
}
