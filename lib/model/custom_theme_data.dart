// ignore_for_file: unnecessary_import

import 'package:example_provider_and_themedata/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomThemeDataModel extends ChangeNotifier {
  ThemeData _themeData = myThemePurple;

  ThemeData get getThemeData => _themeData;

  void setThemeData(ThemeData data) {
    _themeData = data;
    notifyListeners();
  }
}
