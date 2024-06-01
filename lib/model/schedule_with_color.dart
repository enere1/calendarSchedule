import 'package:calender_schdule/database/drift_database.dart';
import 'package:drift/drift.dart';

class ScheduleWithColor {
  final Schedule schedule;
  final CategoryColor categoryColor;

  ScheduleWithColor({
    required this.categoryColor,
    required this.schedule
  });
}