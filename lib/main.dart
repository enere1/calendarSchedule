import 'package:calender_schdule/database/drift_database.dart';
import 'package:calender_schdule/screen/home_screen.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';

const DEFAULT_COLORS = [
  // レッド
  'F44336',
  // オレンジ
  'FF9800',
  // 黄色い
  'FFEB3B',
  // 緑
  'FCAF50',
  // 青
  '2196F3',
  // 紺
  '3F51B5',
  // 紫
  '9C27B0',
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  final database = LocalDatabase();

  GetIt.I.registerSingleton<LocalDatabase>(database);

  final colors = await database.getCategoryColors();
  if (colors.isEmpty) {
    for (String hexCode in DEFAULT_COLORS) {
      await database.createCategoryColor(
        CategoryColorsCompanion(
          hexCode: Value(hexCode)
        )
      );
    }
  }


  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Notosans',
      ),
      home: HomeScreen(),
    ),
  );
}
