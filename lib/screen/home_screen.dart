import "package:calender_schdule/component/schedule_card.dart";
import "package:calender_schdule/component/today_banner.dart";
import "package:calender_schdule/const/colors.dart";
import "package:calender_schdule/database/drift_database.dart";
import "package:calender_schdule/model/schedule_with_color.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";

import "../component/calendar.dart";
import "../component/schedule_bottom_sheet.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(),
      body: SafeArea(
          child: Column(
        children: [
          Calendar(
            selectedDay: selectedDay,
            focusedDay: focusedDay,
            onDaySelected: ondaySelected,
          ),
          SizedBox(height: 8.0),
          TodayBanner(selectedDay: selectedDay),
          SizedBox(height: 8.0),
          _ScheduleList(selectedDay: selectedDay)
        ],
      )),
    );
  }

  ondaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) {
              return ScheduleBottomSheet(selectedDate: selectedDay);
            });
      },
      backgroundColor: PRIMARY_COLOR,
      shape: CircleBorder(),
      child: Icon(
        Icons.add,
      ),
    );
  }
}

class _ScheduleList extends StatelessWidget {
  final DateTime selectedDay;

  const _ScheduleList({required this.selectedDay, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: StreamBuilder<List<ScheduleWithColor>>(
            stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDay),
            builder: (context, snapshot) {

              if(!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              if(snapshot.hasData && snapshot.data!.isEmpty) {
                return Center(child: Text(
                  "予定がありません。"
                ));
              }

              return ListView.separated(
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 5.0);
                  },
                  itemBuilder: (context, index) {
                    final scheduleWithColor = snapshot.data![index];
                    return Dismissible(
                      key: ObjectKey(scheduleWithColor.schedule.id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (DismissDirection direction){
                        GetIt.I<LocalDatabase>().removeSchedule(scheduleWithColor.schedule.id);
                      },
                      child: GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (_) {
                                return ScheduleBottomSheet(selectedDate: selectedDay, scheduleId: scheduleWithColor.schedule.id);
                              });
                        },
                        child: ScheduleCard(
                            startTime: scheduleWithColor.schedule.startTime,
                            endTime: scheduleWithColor.schedule.endTime,
                            content: scheduleWithColor.schedule.content,
                            color: Color(
                              int.parse('FF${scheduleWithColor.categoryColor.hexCode}',
                              radix: 16)
                            )),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
