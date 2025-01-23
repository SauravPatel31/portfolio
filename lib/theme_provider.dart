import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;
  Future<void> getPrefValue()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    pref.get("ThemeKey")??false;
    notifyListeners();

  }
  Future<void> changeThemeValue({required bool newValue})async {
    _isDark=newValue;
    SharedPreferences prefs =await SharedPreferences.getInstance();
    prefs.setBool("ThemeKey", newValue);
    notifyListeners();
  }
   getThemeValue()=>_isDark;
}