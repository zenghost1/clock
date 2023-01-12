// ignore_for_file: prefer_const_constructors

import 'package:flutter_alarm_clock/enums.dart';
import 'package:flutter_alarm_clock/models/menu_info.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'views/homepage.dart';
import 'package:flutter/material.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotification =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;

  flutterLocalNotification
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .requestPermission();

  var initializationSettingsAndroid =
      AndroidInitializationSettings('codextutorials_logo');
  var initializationSettingIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: ((id, title, body, payload) async {}));

  var intializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingIOS);

  await flutterLocalNotification.initialize(intializationSettings,
      onSelectNotification: ((payload) async {
    if (payload != null) {
      debugPrint('notification payload:' + payload);
    }
  }));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context) => MenuInfo(
          MenuType.clock,
          imageSource: 'null',
          title: 'Clock',
        ),
        child: HomePage(),
      ),
    );
  }
}
