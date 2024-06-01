import 'package:calender_schdule/const/colors.dart';
import 'package:calender_schdule/database/drift_database.dart';
import 'package:calender_schdule/model/schedule_with_color.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;

  const TodayBanner(
      {required this.selectedDay, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle =
        TextStyle(fontWeight: FontWeight.w600, color: Colors.white);

    return Container(
      color: PRIMARY_COLOR,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedDay.year}年 ${selectedDay.month}月 ${selectedDay.day}日',
              style: textStyle,
            ),
            StreamBuilder<List<ScheduleWithColor>>(
              stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDay),
              builder: (context, snapshot) {
              int count = 0;

              if (snapshot.hasData) {
                count = snapshot.data!.length;
              }

                return Text(
                  '${count}個',
                  style: textStyle,
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
