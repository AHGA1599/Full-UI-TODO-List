import 'package:flutter/material.dart';
import 'package:projecttodo/my_theme.dart';

class EditList extends StatefulWidget {
  static const String routeName = 'editList';

  @override
  State<EditList> createState() => _EditListState();
}

class _EditListState extends State<EditList> {
  DateTime selectTime = DateTime.now();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ToDoList',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          toolbarHeight: 100,
        ),
        body: Container(
          decoration: BoxDecoration(
              color: MyTheme.whitecolor,
              borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
              vertical: MediaQuery.of(context).size.height * 0.02),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text('Edit Task',
                    style: Theme.of(context).textTheme.titleMedium),
                Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return ' Enter This title';
                            }
                            return null;
                          },
                          decoration:
                              InputDecoration(hintText: 'This is Title'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'please Enter Task Details';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Task Details',
                          ),
                          maxLines: 4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Select Date',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // show calender
                          showCalender();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            '${selectTime.day}/${selectTime.month}/${selectTime.year}',
                            style: Theme.of(context).textTheme.titleSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(

                          onPressed: () {
                            //save task to firebase
                            saveTask();
                          },
                          child: Text('Save Changes',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: MyTheme.whitecolor)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
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
  void saveTask() {
    if(formkey.currentState?.validate()==true){
//add task to firebase
    }
  }
}
