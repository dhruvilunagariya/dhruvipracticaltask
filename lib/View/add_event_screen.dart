import 'package:dhruvipracticalbinaryapptech/Controller/calender_controller.dart';
import 'package:dhruvipracticalbinaryapptech/View/calender_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEventScreen extends StatelessWidget {
  AddEventScreen({Key? key}) : super(key: key);

  final calenderController = Get.find<CalenderController>();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: calenderController.selectedStartDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null &&
        picked != calenderController.selectedStartDate.value) {
      calenderController.selectedStartDate.value = picked;
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: calenderController.selectedEndDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != calenderController.selectedEndDate.value) {
      calenderController.selectedEndDate.value = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: calenderController.eventNameController,
              decoration: InputDecoration(hintText: "Enter Event Name"),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${calenderController.selectedStartDate.value.toLocal()}"
                      .split(' ')[0]),
                  MaterialButton(
                    onPressed: () {
                      _selectStartDate(context);
                    },
                    color: Colors.grey.shade300,
                    child: Text("Select Start Date"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${calenderController.selectedEndDate.value.toLocal()}"
                      .split(' ')[0]),
                  MaterialButton(
                    onPressed: () {
                      _selectEndDate(context);
                    },
                    color: Colors.grey.shade300,
                    child: Text("Select End Date"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              onPressed: () {
                calenderController.meetings.value.add(Meeting(
                    calenderController.eventNameController.text,
                    DateTime(
                        calenderController.selectedStartDate.value.year,
                        calenderController.selectedStartDate.value.month,
                        calenderController.selectedStartDate.value.day),
                    DateTime(
                        calenderController.selectedEndDate.value.year,
                        calenderController.selectedEndDate.value.month,
                        calenderController.selectedEndDate.value.day),
                    Colors.green,
                    true));
                calenderController.meetings.refresh();
                Get.back();
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
