import 'dart:io';


import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LawCatalog {
  final int id;
  final int level;
  final String ty;
  final String aty;
  final String name;
  final int endLevel;


  // id integer PRIMARY KEY AUTOINCREMENT NOT NULL,
  // level int NOT NULL DEFAULT(1),
  // ty char(4),
  // aty char(8),
  // name varchar(255) NOT NULL,
  // end_level bool NOT NULL DEFAULT(0)

  LawCatalog({
    this.id, 
    this.level, 
    this.ty, 
    this.aty,
    this.name, 
    this.endLevel,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'level': level,
      'ty': ty,
      'aty': aty,
      'name': name,
      'end_level': endLevel,
    };
  }

  @override
  String toString() {
    return 'lawCatalog{id: $id, ty: $ty, aty: $aty, level: $level, name: $name, end_level: $endLevel}';
  }
}

class LawCatalogService {
  Future<List<LawCatalog>> getLawCatalogs1({catID = 'cat1'}) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String databasePath = join(documentsDirectory.path, "asset_roclaws_base.sqlite");

    final Future<Database> database = openDatabase(databasePath, readOnly:true);
    final Database db = await database;
    List<Map<String, dynamic>> maps;
    switch (catID) {
      case 'cat1':
        maps = await db.query('catalogs',where:'level=0');
        break;
      case 'cat2':
        maps = await db.query('catalogs',where:'ty>=\'A0\' and ty<=\'Z9\' and length(ty)=2');
        break;
      case 'cat3':
        maps = await db.query('catalogs',where:'ty>=\'0000\' and ty<=\'0999\' and length(ty)=4');
        break;
      case 'cat4':
        maps = await db.query('catalogs',where:'ty>=\'91\' and ty<=\'99\' and length(ty)=2');
        break;
      default:
        maps = await db.query('catalogs',where:'level=0');
    }

    // Convert the Catalog<Map<String, dynamic> into a Catalog<LawCatalog>.
    return List.generate(maps.length, (i) {
      return LawCatalog(
        id: maps[i]['id'],
        ty: maps[i]['ty'],
        aty: maps[i]['aty'],
        level: maps[i]['level'],
        name: maps[i]['name'],
        endLevel: maps[i]['end_level'],
      );
    });
  }
}