import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LawList {
  final int id;
  final String ty;
  final String aty;
  final String pcode;
  final String name;
  final int eng;
  final int fei;
  final String publishDate;
  final String repealDate;
  final String amendDate;
  final String attachments;
  final String historys;

  LawList({
    this.id, 
    this.ty, 
    this.aty,
    this.pcode, 
    this.name, 
    this.eng,
    this.fei, 
    this.publishDate, 
    this.repealDate,
    this.amendDate, 
    this.attachments, 
    this.historys,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ty': ty,
      'aty': aty,
      'pcode': pcode,
      'name': name,
      'eng': eng,
      'fei': fei,
      'publish_date': publishDate,
      'repeal_date': repealDate,
      'amend_date': amendDate,
      'attachments': attachments,
      'historys': historys,
    };
  }

  @override
  String toString() {
    return 'lawList{id: $id, ty: $ty, aty: $aty, pcode: $pcode, name: $name, eng: $eng, fei: $fei, publish_date: $publishDate, repeal_date: $repealDate, amend_date: $amendDate, attachments: $attachments, historys: $historys}';
  }
}

class LawListService {
  final Future<Database> database = openDatabase(
    join('assets', 'db', 'roclaws_base.sqlite'),
  );


  Future<List<LawList>> getLawLists({String ty, String aty}) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = 
      await db.query(
        'lists',
        where:'ty=? and aty=?',
        whereArgs: [ty, aty],
      );

    // Convert the List<Map<String, dynamic> into a List<LawList>.
    return List.generate(maps.length, (i) {
      return LawList(
        id: maps[i]['id'],
        ty: maps[i]['ty'],
        aty: maps[i]['aty'],
        pcode: maps[i]['pcode'],
        name: maps[i]['name'],
        eng: maps[i]['eng'],
        fei: maps[i]['fei'],
        publishDate: maps[i]['publish_date'],
        repealDate: maps[i]['repeal_date'],
        amendDate: maps[i]['amend_date'],
        attachments: maps[i]['attachments'],
        historys: maps[i]['historys'],
      );
    });

  }
}