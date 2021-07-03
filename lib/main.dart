import 'package:app_builder/provider/PostsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/FileProvider.dart';
import 'ui/home-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // Config config = Provider.of<ParseJson>(context).getConfig();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: ParsePosts(),
          ),
          ChangeNotifierProvider.value(value: ParseJson()),
        ],
        child: ChangeNotifierProvider<ParseJson>(
          create: (context) => ParseJson(),
          child: Consumer<ParseJson>(
            builder: (context, model, child) {
              if (model.getConfig() != null) {
                return MaterialApp(

                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: Colors.green,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    scaffoldBackgroundColor:
                        HexColor.fromHex(model.getConfig().appColor.pageBg),
                  ),

                  home: HomePage("home", null), //WebViewScreen(),
                );
              }
            },
          ),
        ));
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
