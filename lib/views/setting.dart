import "package:flutter/material.dart";
import 'package:flutter_i18n/flutter_i18n.dart';

// import 'package:roclaws/configs/languages.dart';
import 'package:roclaws/configs/themes.dart';
import 'package:provider/provider.dart';
import 'package:roclaws/components/theme_option.dart';
import 'package:roclaws/models/setting.dart';
import 'package:roclaws/components/drawer_menus.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var setting = Provider.of<SettingModel>(context);
    Locale currentLang = FlutterI18n.currentLocale(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(FlutterI18n.translate(context, "menu.setting")),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            leading: Icon(Icons.palette),
            title: Text(FlutterI18n.translate(context, "setting.theme")),
            children: <Widget>[
              Wrap(
                spacing: 8.0,
                children: <Widget>[
                  ThemeOption(
                    color: Colors.blue,
                    onPressed: () => setting
                        .changeTheme(appLightThemeData[AppTheme.BlueLight]),
                  ),
                  ThemeOption(
                    color: Colors.blueGrey,
                    onPressed: () => setting
                        .changeTheme(appLightThemeData[AppTheme.BlackDark]),
                  ),
                ],
              )
            ],
          ),
          // ListTile(
          //   leading: Icon(Icons.language),
          //   title: Text(FlutterI18n.translate(context, "setting.language")),
          //   trailing: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: <Widget>[
          //       Text(localeLangStrMap[currentLang.toString()]),
          //       Icon(Icons.keyboard_arrow_right),
          //     ],
          //   ),
          //   onTap: () {
          //     Navigator.of(context).pushNamed("/setting/language");
          //   },
          // ),
        ],
      ),
      drawer:DrawerMenu(),
    );
  }
}