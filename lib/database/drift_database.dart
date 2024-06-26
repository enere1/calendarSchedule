// privateの値は呼び出せない
import 'dart:io';
import 'package:calender_schdule/model/category_color.dart';
import 'package:calender_schdule/model/schedule.dart';
import 'package:calender_schdule/model/schedule_with_color.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// privateの値は呼び出せる
part 'drift_database.g.dart';

@DriftDatabase(tables: [Schedules, CategoryColors])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);

  Future<int> createCategoryColor(CategoryColorsCompanion data) =>
      into(categoryColors).insert(data);

  Future<List<CategoryColor>> getCategoryColors() =>
      select(categoryColors).get();

  Stream<List<ScheduleWithColor>> watchSchedules(DateTime dateTime) {
    final query = select(schedules).join([
      innerJoin(categoryColors, categoryColors.id.equalsExp(schedules.colorId))
    ]);

    query.where(schedules.date.equals(dateTime));
    query.orderBy([OrderingTerm.asc(schedules.startTime)]);
    return query.watch().map((rows) => rows
        .map(
          (row) => ScheduleWithColor(
            categoryColor: row.readTable(categoryColors),
            schedule: row.readTable(schedules),
          ),
        )
        .toList());
  }

  // delete.go() -> 全レコード削除
  Future<int> removeSchedule(int id) => (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();

  Future<int> updateScheduleById(int id, SchedulesCompanion data) => (update(schedules)..where((tbl) => tbl.id.equals(id))).write(data);

  Future<Schedule> getSchedule(int id) => (select(schedules)..where((tbl) => tbl.id.equals(id))).getSingle();

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
