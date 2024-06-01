import 'package:drift/drift.dart';

class Schedules extends Table {
  // PRIMARY
  IntColumn get id => integer().autoIncrement()();
  // 本文
  TextColumn get content => text()();
  // 日程
  DateTimeColumn get date => dateTime()();
  // 開始
  IntColumn get startTime => integer()();
  // 終了
  IntColumn get endTime => integer()();
  // カテゴリ
  IntColumn get colorId => integer()();
  // 作成日
  DateTimeColumn get createdAt => dateTime().clientDefault(
      () => DateTime.now()
  )();
}

