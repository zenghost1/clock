import 'package:flutter_alarm_clock/constants/theme.dart';
import 'package:flutter_alarm_clock/enums.dart';
import 'models/alarm_info.dart';
import 'models/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: '  Clock  ', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: '  Alarm  ', imageSource: 'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer,
      title: '  Timer  ', imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: 'StopWatch', imageSource: 'assets/stopwatch_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(
      DateTime.now().add(const Duration(
        hours: 1,
      )),
      description: 'Office',
      isActive: true,
      gradientColor: GradientColors.sky),
  AlarmInfo(
      DateTime.now().add(const Duration(
        hours: 2,
      )),
      description: 'Sport',
      isActive: true,
      gradientColor: GradientColors.sunset),
];
