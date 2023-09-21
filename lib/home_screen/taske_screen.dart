import 'package:flutter/material.dart';
import 'package:projecttodo/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskeScreen extends StatefulWidget {
  @override
  State<TaskeScreen> createState() => _TaskeScreenState();
}

class _TaskeScreenState extends State<TaskeScreen> {
  DateTime selectTime = DateTime.now();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.title1,
                style: Theme.of(context).textTheme.titleMedium),
            Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'please Enter your title';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.title2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'please Enter your Description';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.des,
                      ),
                      maxLines: 4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.select_date,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // show calender
                      showCalender();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${selectTime.day}/${selectTime.month}/${selectTime.year}',
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //add task to firebase
                      addTask();
                    },
                    child: Text(AppLocalizations.of(context)!.add,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: MyTheme.whitecolor)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showCalender() async {
    var choseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 350)),
    );
    if (choseDate != null) {
      selectTime = choseDate;
      setState(() {});
    }
  }

  void addTask() {
    if (formkey.currentState?.validate() == true) {
//add task to firebase
    }
  }
}
