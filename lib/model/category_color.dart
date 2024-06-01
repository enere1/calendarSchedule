import 'package:drift/drift.dart';

class CategoryColors extends Table {
  // PRIMARY
  IntColumn get id => integer().autoIncrement()();
  // 色コード
  TextColumn get hexCode => text()();
}