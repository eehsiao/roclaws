import "package:flutter/material.dart";
import 'package:package_info/package_info.dart';

import 'package:roclaws/components/drawer_menus.dart';

class List2Page extends StatefulWidget {
  @override
  _List2PageState createState() => _List2PageState();
}

class _List2PageState extends State<List2Page> {
  String appVesion = "0.0.0";

  @override
  void initState() {
    super.initState();
    fetchAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List2"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: viewportConstraints.maxWidth,
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 40.0,
                        ),
                        SizedBox(height: 8.0),
                        Text("waalii roclaws",
                            style: Theme.of(context).textTheme.title),
                        SizedBox(height: 4.0),
                        Text(appVesion,
                              style: Theme.of(context).textTheme.subtitle),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Made by eehsiao",
                            style: Theme.of(context).textTheme.caption),
                        Text("License ...",
                            style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      drawer:DrawerMenu(),
    );
  }

  Future fetchAppVersion() async {
    PackageInfo pacakgeInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVesion = pacakgeInfo.version;
    });
  }
}
