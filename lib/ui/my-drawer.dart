import 'package:app_builder/ui/home-page.dart';
import 'package:app_builder/ui/web-view.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/FileProvider.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    var config = Provider.of<ParseJson>(context).getConfig();

    return Drawer(
      child: Container(
        color: HexColor.fromHex(
            (config != null ? config.appColor.menuBg : "#ffffff")),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 200.0,
              child: DrawerHeader(
                child: Center(
                  child: Text(
                    'Objects',
                    style: new TextStyle(fontSize: 24.0, color: HexColor.fromHex(
                        (config != null ? config.appColor.headerText : "#ffffff"))),
                  ),
                ),
                decoration: BoxDecoration(
                  color: HexColor.fromHex(
                      (config != null ? config.appColor.headerBg : "#ffffff")),
                ),
              ),
            ),
            Container(
              height: double.maxFinite,
              child: ListView.builder(
                  itemCount:
                      config.menuItems == null ? 0 : config.menuItems.length,
                  itemBuilder: (BuildContext context, i) {
                    return Container(
                      color: _currentSelected == i
                          ? HexColor.fromHex((config != null
                              ? config.appColor.menuItemSelectedBgColor
                              : "#ffffff"))
                          : HexColor.fromHex((config != null
                              ? config.appColor.menuItemBGColor
                              : "#ffffff")),
                      child: new ListTile(
                        title: new Text(
                          config.menuItems[i].title,
                          style: TextStyle(
                              backgroundColor: HexColor.fromHex((config != null
                                  ? config.appColor.menuItemBGColor
                                  : "#ffffff"))),
                        ),
                        onTap: () {
                          // print("Home Clicked");
                          Navigator.pop(context);
                          if (config.menuItems[i].component == "posts") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(
                                      (config.menuItems[i].title),
                                      (config.menuItems[i].parameters.userId !=
                                              null
                                          ? config.menuItems[i].parameters.userId
                                          : null)),
                                ));
                          } else if (config.menuItems[i].component ==
                              "external-page") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebViewScreen(
                                      (config.menuItems[i].parameters.url != null
                                          ? config.menuItems[i].parameters.url
                                          : "https://www.thesportsdb.com/"),
                                      (config != null
                                          ? config.menuItems[i].title
                                          : ""),config.appColor.headerBg)),
                            );
                          }
                          setState(() {
                            _currentSelected = i;
                          });
                        },
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
