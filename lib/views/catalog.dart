import "package:flutter/material.dart";
import 'package:package_info/package_info.dart';
import 'package:flutter_i18n/flutter_i18n.dart';


import '../components/drawer_menus.dart';
import '../models/law_catalogs.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({
    Key key,
    this.catID = "",
  }) : super(key: key);

  final String catID;

  @override
  _CatalogPageState createState() => _CatalogPageState(catID:catID);
}

class _CatalogPageState extends State<CatalogPage> {
 _CatalogPageState({
    this.catID = "",
  });

  final String catID;

  List<LawCatalog> _catLists = new List<LawCatalog>();

  @override
  void initState() {
    super.initState();
    _getRecords(catID);
  }

  void _getRecords(String catID) async {
    this._catLists = await LawCatalogService().getLawCatalogs1(catID:catID);
    setState((){});
    // debugPrint('catID: $catID');
    // for (LawCatalog l in catLists) {
    //   debugPrint(l.toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FlutterI18n.translate(context, "menu."+catID)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: _buildList(context),
      resizeToAvoidBottomPadding: false,
      drawer:DrawerMenu(),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: this._catLists.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, LawCatalog record) {
    return Card(
      key: ValueKey(record.name),
      child: Container(
        child: ListTile(
          title: Text(
            record.name,
          ),
        ),
      ),
    );
  }
}
