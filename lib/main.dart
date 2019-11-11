import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import "routes.dart";
import 'models/setting.dart';
import 'views/about.dart';
import 'views/setting.dart';
import 'views/catalog.dart';
// import 'views/list1.dart';
// import 'views/list2.dart';
// import 'views/list3.dart';
// import 'views/list4.dart';

Future main() async {
  await DotEnv().load('.env');

  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String databasePath = join(documentsDirectory.path, "asset_roclaws_base.sqlite");
  // debugPrint('init database : $databasePath');
  
  // Only copy if the database doesn't exist
  if (FileSystemEntity.typeSync(databasePath) == FileSystemEntityType.notFound){
    // Load database from asset and copy
    // debugPrint('copy database : ' + FileSystemEntity.typeSync(databasePath).toString());
    ByteData data = await rootBundle.load(join('assets', 'db', 'roclaws_base.sqlite'));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Save copied asset to documents
    await new File(databasePath).writeAsBytes(bytes);
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(builder: (BuildContext context) => SettingModel())
    ],
    child: MyApp(),
  ));
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var setting = Provider.of<SettingModel>(context);
    return MaterialApp(
      title: '台灣六法全書',
      theme: setting.theme,
      routes: {
        MyRoutes.home: (context) => CatalogPage(catID:"cat1"),
        MyRoutes.cat1: (context) => CatalogPage(catID:"cat1"),
        MyRoutes.cat2: (context) => CatalogPage(catID:"cat2"),
        MyRoutes.cat3: (context) => CatalogPage(catID:"cat3"),
        MyRoutes.cat4: (context) => CatalogPage(catID:"cat4"),
        MyRoutes.setting: (context) => SettingPage(),
        MyRoutes.about: (context) => AboutPage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case MyRoutes.root:
            return MaterialPageRoute(builder: (context) => CatalogPage(catID:"cat1"));
          default:
            return MaterialPageRoute(builder: (context) => CatalogPage(catID:"cat1"));
        }
      },
      localizationsDelegates: [
        FlutterI18nDelegate(
          useCountryCode: false,
          fallbackFile: "zh_TW",
          path: "assets/i18n",
          forcedLocale: Locale("zh", "TW"),
        ),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}