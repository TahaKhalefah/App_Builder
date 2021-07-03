class Config {
  MainConfig mainConfig;
  AppColor appColor;
  List<MenuItems> menuItems;

  Config({this.mainConfig, this.appColor, this.menuItems});

  Config.fromJson(Map<String, dynamic> json) {
    mainConfig = json['mainConfig'] != null
        ? new MainConfig.fromJson(json['mainConfig'])
        : null;
    appColor = json['appColor'] != null
        ? new AppColor.fromJson(json['appColor'])
        : null;
    if (json['menuItems'] != null) {
      menuItems = new List<MenuItems>();
      json['menuItems'].forEach((v) {
        menuItems.add(new MenuItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainConfig != null) {
      data['mainConfig'] = this.mainConfig.toJson();
    }
    if (this.appColor != null) {
      data['appColor'] = this.appColor.toJson();
    }
    if (this.menuItems != null) {
      data['menuItems'] = this.menuItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainConfig {
  String baseUrl;

  MainConfig({this.baseUrl});

  MainConfig.fromJson(Map<String, dynamic> json) {
    baseUrl = json['baseUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['baseUrl'] = this.baseUrl;
    return data;
  }
}

class AppColor {
  String pageBg;
  String headerBg;
  String headerText;
  String menuBg;
  String menuItemBGColor;
  String menuItemSelectedBgColor;
  String listTitle;
  String listItemBg;
  String textColor;

  AppColor(
      {this.pageBg,
      this.headerBg,
      this.headerText,
      this.menuBg,
      this.menuItemBGColor,
      this.menuItemSelectedBgColor,
      this.listTitle,
      this.listItemBg,
      this.textColor});

  AppColor.fromJson(Map<String, dynamic> json) {
    pageBg = json['pageBg'];
    headerBg = json['headerBg'];
    headerText = json['headerText'];
    menuBg = json['menuBg'];
    menuItemBGColor = json['menuItemBGColor'];
    menuItemSelectedBgColor = json['menuItemSelectedBgColor'];
    listTitle = json['listTitle'];
    listItemBg = json['listItemBg'];
    textColor = json['textColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageBg'] = this.pageBg;
    data['headerBg'] = this.headerBg;
    data['headerText'] = this.headerText;
    data['menuBg'] = this.menuBg;
    data['menuItemBGColor'] = this.menuItemBGColor;
    data['menuItemSelectedBgColor'] = this.menuItemSelectedBgColor;
    data['listTitle'] = this.listTitle;
    data['listItemBg'] = this.listItemBg;
    data['textColor'] = this.textColor;
    return data;
  }
}

class MenuItems {
  String component;
  Parameters parameters;
  String title;

  MenuItems({this.component, this.parameters, this.title});

  MenuItems.fromJson(Map<String, dynamic> json) {
    component = json['component'];
    parameters = json['parameters'] != null
        ? new Parameters.fromJson(json['parameters'])
        : null;
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['component'] = this.component;
    if (this.parameters != null) {
      data['parameters'] = this.parameters.toJson();
    }
    data['title'] = this.title;
    return data;
  }
}

class Parameters {
  String apiName;
  int userId;
  String url;

  Parameters({this.apiName, this.userId, this.url});

  Parameters.fromJson(Map<String, dynamic> json) {
    apiName = json['apiName'];
    userId = json['userId'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apiName'] = this.apiName;
    data['userId'] = this.userId;
    data['url'] = this.url;
    return data;
  }
}
