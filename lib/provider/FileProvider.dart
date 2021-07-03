import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import '../model/Config.dart';

class ParseJson extends ChangeNotifier {
  var _config;

  ParseJson() {
    loadConfig();
  }

  Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assets/config.json');
  }

  Config getConfig() {
    return _config;
  }

  Future loadConfig() async {
    String jsonString = await _loadAStudentAsset();

    final jsonResponse = json.decode(jsonString);
    Config config = new Config.fromJson(jsonResponse);
    _config = config;
    notifyListeners();
  }
}
