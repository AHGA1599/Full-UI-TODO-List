
import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String applanguage = 'en';
  ThemeMode appTheme=ThemeMode.light;

  void changLanguage(String NewLanguage){
    if(NewLanguage== applanguage){
      return;
    }else{
      applanguage=NewLanguage;
      notifyListeners();
    }
  }
  void changTheme (ThemeMode newMode){
if(appTheme == newMode){
  return;
}else{
  appTheme=newMode;
  notifyListeners();
}
  }
}