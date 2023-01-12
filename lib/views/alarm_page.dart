// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/constants/theme.dart';
import 'package:flutter_alarm_clock/data.dart';

import '../models/alarm_info.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 64,
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alarm',
              style: TextStyle(
                fontFamily: 'avenir',
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            Expanded(
              child: ListView(
                children: alarms.map<Widget>((AlarmInfo alarm) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 32),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: alarm.gradientColor.last.withOpacity(0.4),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(4, 4),
                          )
                        ],
                        gradient: LinearGradient(
                          colors: alarm.gradientColor,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.label,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Office',
                                  style: TextStyle(
                                    fontFamily: 'avenir',
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                              value: true,
                              onChanged: ((bool value) {}),
                              activeColor: Colors.white,
                            ),
                          ],
                        ),
                        Text(
                          'Mon-Fri',
                          style: TextStyle(
                            fontFamily: 'avenir',
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '7:00 AM',
                              style: TextStyle(
                                fontFamily: 'avenir',
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 36,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }).followedBy([
                  DottedBorder(
                    dashPattern: [5, 4],
                    strokeWidth: 2,
                    color: CustomColors.clockOutline,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(24),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: CustomColors.clockBG,
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                          ),
                        ),
                        onPressed: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/add_alarm.png',
                              scale: 1.5,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Add Alarm',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'avenir'),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ]).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
