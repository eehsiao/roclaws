import "package:flutter/material.dart";
import 'package:flutter_i18n/flutter_i18n.dart';

import "../routes.dart";

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key key,
    this.icon,
    this.text = "",
    this.onPressed,
  }) : super(key: key);

  final Icon icon;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          icon,
          SizedBox(width: 24.0),
          Text(text),
        ],
      ),
      onTap: onPressed ?? () {},
    );
  }
}


class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerTile(
                icon: Icon(Icons.settings_applications),
                text: "",
                onPressed: () => {},
              ),
              DrawerTile(
                icon: Icon(Icons.list),
                text: FlutterI18n.translate(context, "menu.cat1"),
                onPressed: () => Navigator.of(context).pushNamed(MyRoutes.cat1),
              ),
              DrawerTile(
                icon: Icon(Icons.list),
                text: FlutterI18n.translate(context, "menu.cat2"),
                onPressed: () => Navigator.of(context).pushNamed(MyRoutes.cat2),
              ),
              DrawerTile(
                icon: Icon(Icons.list),
                text: FlutterI18n.translate(context, "menu.cat3"),
                onPressed: () => Navigator.of(context).pushNamed(MyRoutes.cat3),
              ),
              DrawerTile(
                icon: Icon(Icons.list),
                text: FlutterI18n.translate(context, "menu.cat4"),
                onPressed: () => Navigator.of(context).pushNamed(MyRoutes.cat4),
              ),
              DrawerTile(
                icon: Icon(Icons.info),
                text: FlutterI18n.translate(context, "menu.about"),
                onPressed: () => Navigator.of(context).pushNamed(MyRoutes.about),
              ),
              DrawerTile(
                icon: Icon(Icons.settings),
                text: FlutterI18n.translate(context, "menu.setting"),
                onPressed: () => Navigator.of(context).pushNamed(MyRoutes.setting),
              ),
            ],
          ),
    );
  }
}
