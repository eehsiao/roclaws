import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:roclaws/configs/languages.dart';
import 'package:roclaws/configs/themes.dart';

class SettingModel extends ChangeNotifier {
  ThemeData _themeData = appLightThemeData[AppTheme.BlueLight];
  Language _language = Language.zhTW;

  ThemeData get theme => _themeData;
  Language get language => _language;

  changeTheme(themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  changeLanguage(Language lang) {
    _language = lang;
    notifyListeners();
  }
}
