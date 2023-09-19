import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:projecttodo/list_tab/task_widget.dart';
import 'package:projecttodo/my_theme.dart';


class ListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: MyTheme.blackcolor,
          dayColor: MyTheme.blackcolor,
          activeDayColor: MyTheme.whitecolor,
          activeBackgroundDayColor: Theme.of(context).primaryColor,
          dotsColor: MyTheme.whitecolor,
          selectableDayPredicate: (date) => true,
          locale: 'en',
        ),

        Expanded(
          child: ListView.builder(itemBuilder: ((context, index) {
            return TaskWidget();
          }),
            itemCount: 20,

          ),
        ),
      ],
    );
  }
}

