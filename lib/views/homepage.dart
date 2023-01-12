// ignore_for_file: prefer_const_constructors

import 'package:flutter_alarm_clock/views/alarm_page.dart';
import 'package:flutter_alarm_clock/views/clock_page.dart';
import 'package:flutter_alarm_clock/data.dart';
import 'package:flutter_alarm_clock/enums.dart';
import 'package:flutter_alarm_clock/models/menu_info.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildMenuItem(currentMenuInfo))
                .toList(),
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (context, value, child) {
                if (value.menuType == MenuType.clock) {
                  return ClockPage();
                } else if (value.menuType == MenuType.alarm) {
                  return AlarmPage();
                }
                ;

                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: ((context, value, child) => TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(32)))),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 16, horizontal: 5),
              ),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (currentMenuInfo.menuType == value.menuType) {
                  return Colors.black54.withOpacity(0.1);
                } else {
                  return Colors.transparent;
                }
              }),
            ),
            onPressed: (() {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            }),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 70,
                      child: Column(
                        children: [
                          Image.asset(
                            currentMenuInfo.imageSource,
                            scale: 1.5,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            currentMenuInfo.title,
                            style: TextStyle(
                              fontFamily: 'avenir',
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
