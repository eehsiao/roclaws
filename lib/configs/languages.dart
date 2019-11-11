import 'package:flutter/material.dart';

enum Language { zhTW, zhCN, enUS }

Map langLocaleMap = {
  Language.zhTW: Locale("zh", "TW"),
  Language.zhCN: Locale("zh", "CN"),
  Language.enUS: Locale("en", "US"),
};

Map localeLangStrMap = {
  "zh_TW": "繁體中文",
  "zh_CN": "简体中文",
  "en_US": "English",
};