import "package:flutter/material.dart";
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

import 'package:roclaws/tools/utils.dart';
import 'package:roclaws/configs/languages.dart';
import 'package:roclaws/models/setting.dart';

class SettingLang extends StatefulWidget {
  @override
  _SettingLangState createState() => _SettingLangState();
}

class _SettingLangState extends State<SettingLang> {
  SettingModel setting;

  @override
  Widget build(BuildContext context) {
    setting = Provider.of<SettingModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          FlutterI18n.translate(context, "setting.language"),
        ),
      ),
      body: ListView(
        children: <Widget>[
          RadioListTile(
            title: Text("English"),
            value: Language.enUS,
            groupValue: setting.language,
            onChanged: _changeLang,
          ),
          RadioListTile(
            title: Text("繁體中文"),
            value: Language.zhTW,
            groupValue: setting.language,
            onChanged: _changeLang,
          ),
          RadioListTile(
            title: Text("简体中文"),
            value: Language.zhCN,
            groupValue: setting.language,
            onChanged: _changeLang,
          ),
        ],
      ),
    );
  }

  Future _changeLang(Language changedLang) async {
    setting.changeLanguage(changedLang);
    await FlutterI18n.refresh(context, langLocaleMap[changedLang]);
    showNotify(
      message: FlutterI18n.translate(
        context,
        "setting.switchLangMsg",
        {"lang": langLocaleMap[changedLang].toString()},
      ),
    );
  }
}
