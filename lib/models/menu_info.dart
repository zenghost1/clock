import 'package:flutter/foundation.dart';
import 'package:flutter_alarm_clock/enums.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String title = "title";
  String imageSource = "empty";

  MenuInfo(this.menuType, {required this.imageSource, required this.title});

  updateMenu(MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imageSource = menuInfo.imageSource;

    notifyListeners();
  }
}
