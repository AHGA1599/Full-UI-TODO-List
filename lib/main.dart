

import 'package:flutter/material.dart';
import 'package:projecttodo/home_screen/home_screen.dart';
import 'package:projecttodo/list_tab/edit_list.dart';
import 'package:projecttodo/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:projecttodo/provider/provider_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context)=> AppConfigProvider(),
  child: MyApp(),)
       );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context) => HomeScreen(),
        EditList.routeName:(context)=>EditList(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.applanguage),
      theme:MyTheme.LightMode,
      themeMode: provider.appTheme,
      darkTheme: MyTheme.darkMode,
    );
  }
}