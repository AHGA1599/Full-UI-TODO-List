import 'package:flutter/material.dart';
import 'package:projecttodo/list_tab/edit_list.dart';
import 'package:projecttodo/my_theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slidable(

      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),

        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(15),
            onPressed: (context) {},
            backgroundColor: MyTheme.redcolor,
            foregroundColor: MyTheme.whitecolor,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.delete,
          ),
        ],
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(EditList.routeName);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: MyTheme.whitecolor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                height: 80,
                width: 4,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppLocalizations.of(context)!.title_task,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: MyTheme.primarylight),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppLocalizations.of(context)!.des_task,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 21),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor),
                  child: Icon(
                    Icons.check,
                    size: 30,
                    color: MyTheme.whitecolor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
