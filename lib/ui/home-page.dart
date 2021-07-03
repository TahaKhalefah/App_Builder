import 'package:app_builder/model/Config.dart';
import 'package:app_builder/model/Post.dart';
import 'package:app_builder/provider/FileProvider.dart';
import 'package:app_builder/provider/PostsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my-drawer.dart';

class HomePage extends StatefulWidget {
  var title;
  var params;

  HomePage(this.title, this.params) : super();

  @override
  HomePageState createState() => HomePageState(title, params);
}

class HomePageState extends State<HomePage> {
  var title;
  var params;
  Config config;

  HomePageState(this.title, this.params) : super();
  bool firstRun;
  List<Post> posts;

  @override
  void initState() {
    super.initState();
    firstRun = true;

  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (firstRun) {
      config = Provider.of<ParseJson>(context).getConfig();
      print(" urllll==> ${config.mainConfig.baseUrl}");
      posts = await Provider.of<ParsePosts>(context).getPosts(config.mainConfig.baseUrl,config.menuItems[0].parameters.apiName,params);
      setState(() {
        firstRun = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: HexColor.fromHex((config != null ?config.appColor.headerBg:"#ffffff")),
      appBar: AppBar(
        backgroundColor:HexColor.fromHex(
            (config != null ? config.appColor.headerBg : "#ffffff")),
        title: Text(
          title,
          style: TextStyle(
              color: HexColor.fromHex(
                  (config != null ? config.appColor.headerText : "#ffffff"))),
        ),
      ),
      drawer: MyDrawer(),
      body: (firstRun)
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Consumer<ParsePosts>(builder: (context, model, child) {
                print("data ==>${posts}");
                return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, position) {
                      return Card(
                        color: HexColor.fromHex(
                            (config != null ? config.appColor.listItemBg : "#000000")),
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${(posts[position]).title}",
                                  style: TextStyle(
                                      color: HexColor.fromHex(
                                          (config != null ? config.appColor.listTitle : "#ffffff")), fontSize: 16),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${(posts[position]).body}",
                                    style: TextStyle(
                                        color: HexColor.fromHex(
                                            (config != null ? config.appColor.textColor : "#ffffff")), fontSize: 14),
                                  ),
                                ),
                                Text(
                                  "${(posts[position]).userId}",
                                  style: TextStyle(
                                      color: HexColor.fromHex(
                                          (config != null ? config.appColor.textColor : "#ffffff")), fontSize: 24),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              })),
    );
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
