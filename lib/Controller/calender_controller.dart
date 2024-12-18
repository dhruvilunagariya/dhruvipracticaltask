import 'package:dhruvipracticalbinaryapptech/View/calender_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalenderController extends GetxController {
  Rx<DateTime> focusDay = DateTime.now().obs;
  Rxn<DateTime> selectedDay = Rxn<DateTime>();

  Rx<DateTime> selectedStartDate = DateTime.now().obs;
  Rx<DateTime> selectedEndDate = DateTime.now().obs;

  RxList<Meeting> meetings = <Meeting>[
    Meeting(
        'Conference',
        DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day, 9),
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
                9)
            .add(const Duration(hours: 2)),
        const Color(0xFF0F8644),
        false),
    Meeting('Christmas', DateTime(2024, 12, 25), DateTime(2024, 12, 25),
        Colors.red, true),
    Meeting('Uttarayan', DateTime(2025, 01, 14), DateTime(2025, 01, 14),
        Colors.amber, true),
    Meeting('Republic Day', DateTime(2025, 01, 26), DateTime(2025, 01, 26),
        Colors.blue, true)
  ].obs;

  TextEditingController eventNameController = TextEditingController();
}
