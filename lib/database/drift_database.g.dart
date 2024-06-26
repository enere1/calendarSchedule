// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $SchedulesTable extends Schedules
    with TableInfo<$SchedulesTable, Schedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
      'start_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
      'end_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _colorIdMeta =
      const VerificationMeta('colorId');
  @override
  late final GeneratedColumn<int> colorId = GeneratedColumn<int>(
      'color_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns =>
      [id, content, date, startTime, endTime, colorId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedules';
  @override
  VerificationContext validateIntegrity(Insertable<Schedule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('color_id')) {
      context.handle(_colorIdMeta,
          colorId.isAcceptableOrUnknown(data['color_id']!, _colorIdMeta));
    } else if (isInserting) {
      context.missing(_colorIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Schedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Schedule(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_time'])!,
      colorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $SchedulesTable createAlias(String alias) {
    return $SchedulesTable(attachedDatabase, alias);
  }
}

class Schedule extends DataClass implements Insertable<Schedule> {
  final int id;
  final String content;
  final DateTime date;
  final int startTime;
  final int endTime;
  final int colorId;
  final DateTime createdAt;
  const Schedule(
      {required this.id,
      required this.content,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.colorId,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    map['date'] = Variable<DateTime>(date);
    map['start_time'] = Variable<int>(startTime);
    map['end_time'] = Variable<int>(endTime);
    map['color_id'] = Variable<int>(colorId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SchedulesCompanion toCompanion(bool nullToAbsent) {
    return SchedulesCompanion(
      id: Value(id),
      content: Value(content),
      date: Value(date),
      startTime: Value(startTime),
      endTime: Value(endTime),
      colorId: Value(colorId),
      createdAt: Value(createdAt),
    );
  }

  factory Schedule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Schedule(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      date: serializer.fromJson<DateTime>(json['date']),
      startTime: serializer.fromJson<int>(json['startTime']),
      endTime: serializer.fromJson<int>(json['endTime']),
      colorId: serializer.fromJson<int>(json['colorId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
      'date': serializer.toJson<DateTime>(date),
      'startTime': serializer.toJson<int>(startTime),
      'endTime': serializer.toJson<int>(endTime),
      'colorId': serializer.toJson<int>(colorId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Schedule copyWith(
          {int? id,
          String? content,
          DateTime? date,
          int? startTime,
          int? endTime,
          int? colorId,
          DateTime? createdAt}) =>
      Schedule(
        id: id ?? this.id,
        content: content ?? this.content,
        date: date ?? this.date,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        colorId: colorId ?? this.colorId,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Schedule(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('colorId: $colorId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, content, date, startTime, endTime, colorId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Schedule &&
          other.id == this.id &&
          other.content == this.content &&
          other.date == this.date &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.colorId == this.colorId &&
          other.createdAt == this.createdAt);
}

class SchedulesCompanion extends UpdateCompanion<Schedule> {
  final Value<int> id;
  final Value<String> content;
  final Value<DateTime> date;
  final Value<int> startTime;
  final Value<int> endTime;
  final Value<int> colorId;
  final Value<DateTime> createdAt;
  const SchedulesCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.colorId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SchedulesCompanion.insert({
    this.id = const Value.absent(),
    required String content,
    required DateTime date,
    required int startTime,
    required int endTime,
    required int colorId,
    this.createdAt = const Value.absent(),
  })  : content = Value(content),
        date = Value(date),
        startTime = Value(startTime),
        endTime = Value(endTime),
        colorId = Value(colorId);
  static Insertable<Schedule> custom({
    Expression<int>? id,
    Expression<String>? content,
    Expression<DateTime>? date,
    Expression<int>? startTime,
    Expression<int>? endTime,
    Expression<int>? colorId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (date != null) 'date': date,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (colorId != null) 'color_id': colorId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SchedulesCompanion copyWith(
      {Value<int>? id,
      Value<String>? content,
      Value<DateTime>? date,
      Value<int>? startTime,
      Value<int>? endTime,
      Value<int>? colorId,
      Value<DateTime>? createdAt}) {
    return SchedulesCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      colorId: colorId ?? this.colorId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    if (colorId.present) {
      map['color_id'] = Variable<int>(colorId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchedulesCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('colorId: $colorId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CategoryColorsTable extends CategoryColors
    with TableInfo<$CategoryColorsTable, CategoryColor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryColorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _hexCodeMeta =
      const VerificationMeta('hexCode');
  @override
  late final GeneratedColumn<String> hexCode = GeneratedColumn<String>(
      'hex_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, hexCode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_colors';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryColor> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('hex_code')) {
      context.handle(_hexCodeMeta,
          hexCode.isAcceptableOrUnknown(data['hex_code']!, _hexCodeMeta));
    } else if (isInserting) {
      context.missing(_hexCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryColor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryColor(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hexCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hex_code'])!,
    );
  }

  @override
  $CategoryColorsTable createAlias(String alias) {
    return $CategoryColorsTable(attachedDatabase, alias);
  }
}

class CategoryColor extends DataClass implements Insertable<CategoryColor> {
  final int id;
  final String hexCode;
  const CategoryColor({required this.id, required this.hexCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hex_code'] = Variable<String>(hexCode);
    return map;
  }

  CategoryColorsCompanion toCompanion(bool nullToAbsent) {
    return CategoryColorsCompanion(
      id: Value(id),
      hexCode: Value(hexCode),
    );
  }

  factory CategoryColor.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryColor(
      id: serializer.fromJson<int>(json['id']),
      hexCode: serializer.fromJson<String>(json['hexCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hexCode': serializer.toJson<String>(hexCode),
    };
  }

  CategoryColor copyWith({int? id, String? hexCode}) => CategoryColor(
        id: id ?? this.id,
        hexCode: hexCode ?? this.hexCode,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryColor(')
          ..write('id: $id, ')
          ..write('hexCode: $hexCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, hexCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryColor &&
          other.id == this.id &&
          other.hexCode == this.hexCode);
}

class CategoryColorsCompanion extends UpdateCompanion<CategoryColor> {
  final Value<int> id;
  final Value<String> hexCode;
  const CategoryColorsCompanion({
    this.id = const Value.absent(),
    this.hexCode = const Value.absent(),
  });
  CategoryColorsCompanion.insert({
    this.id = const Value.absent(),
    required String hexCode,
  }) : hexCode = Value(hexCode);
  static Insertable<CategoryColor> custom({
    Expression<int>? id,
    Expression<String>? hexCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hexCode != null) 'hex_code': hexCode,
    });
  }

  CategoryColorsCompanion copyWith({Value<int>? id, Value<String>? hexCode}) {
    return CategoryColorsCompanion(
      id: id ?? this.id,
      hexCode: hexCode ?? this.hexCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hexCode.present) {
      map['hex_code'] = Variable<String>(hexCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryColorsCompanion(')
          ..write('id: $id, ')
          ..write('hexCode: $hexCode')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  _$LocalDatabaseManager get managers => _$LocalDatabaseManager(this);
  late final $SchedulesTable schedules = $SchedulesTable(this);
  late final $CategoryColorsTable categoryColors = $CategoryColorsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [schedules, categoryColors];
}

typedef $$SchedulesTableInsertCompanionBuilder = SchedulesCompanion Function({
  Value<int> id,
  required String content,
  required DateTime date,
  required int startTime,
  required int endTime,
  required int colorId,
  Value<DateTime> createdAt,
});
typedef $$SchedulesTableUpdateCompanionBuilder = SchedulesCompanion Function({
  Value<int> id,
  Value<String> content,
  Value<DateTime> date,
  Value<int> startTime,
  Value<int> endTime,
  Value<int> colorId,
  Value<DateTime> createdAt,
});

class $$SchedulesTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $SchedulesTable,
    Schedule,
    $$SchedulesTableFilterComposer,
    $$SchedulesTableOrderingComposer,
    $$SchedulesTableProcessedTableManager,
    $$SchedulesTableInsertCompanionBuilder,
    $$SchedulesTableUpdateCompanionBuilder> {
  $$SchedulesTableTableManager(_$LocalDatabase db, $SchedulesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SchedulesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SchedulesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$SchedulesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> startTime = const Value.absent(),
            Value<int> endTime = const Value.absent(),
            Value<int> colorId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SchedulesCompanion(
            id: id,
            content: content,
            date: date,
            startTime: startTime,
            endTime: endTime,
            colorId: colorId,
            createdAt: createdAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String content,
            required DateTime date,
            required int startTime,
            required int endTime,
            required int colorId,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SchedulesCompanion.insert(
            id: id,
            content: content,
            date: date,
            startTime: startTime,
            endTime: endTime,
            colorId: colorId,
            createdAt: createdAt,
          ),
        ));
}

class $$SchedulesTableProcessedTableManager extends ProcessedTableManager<
    _$LocalDatabase,
    $SchedulesTable,
    Schedule,
    $$SchedulesTableFilterComposer,
    $$SchedulesTableOrderingComposer,
    $$SchedulesTableProcessedTableManager,
    $$SchedulesTableInsertCompanionBuilder,
    $$SchedulesTableUpdateCompanionBuilder> {
  $$SchedulesTableProcessedTableManager(super.$state);
}

class $$SchedulesTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $SchedulesTable> {
  $$SchedulesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get endTime => $state.composableBuilder(
      column: $state.table.endTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get colorId => $state.composableBuilder(
      column: $state.table.colorId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SchedulesTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $SchedulesTable> {
  $$SchedulesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get endTime => $state.composableBuilder(
      column: $state.table.endTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get colorId => $state.composableBuilder(
      column: $state.table.colorId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$CategoryColorsTableInsertCompanionBuilder = CategoryColorsCompanion
    Function({
  Value<int> id,
  required String hexCode,
});
typedef $$CategoryColorsTableUpdateCompanionBuilder = CategoryColorsCompanion
    Function({
  Value<int> id,
  Value<String> hexCode,
});

class $$CategoryColorsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $CategoryColorsTable,
    CategoryColor,
    $$CategoryColorsTableFilterComposer,
    $$CategoryColorsTableOrderingComposer,
    $$CategoryColorsTableProcessedTableManager,
    $$CategoryColorsTableInsertCompanionBuilder,
    $$CategoryColorsTableUpdateCompanionBuilder> {
  $$CategoryColorsTableTableManager(
      _$LocalDatabase db, $CategoryColorsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CategoryColorsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CategoryColorsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$CategoryColorsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> hexCode = const Value.absent(),
          }) =>
              CategoryColorsCompanion(
            id: id,
            hexCode: hexCode,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String hexCode,
          }) =>
              CategoryColorsCompanion.insert(
            id: id,
            hexCode: hexCode,
          ),
        ));
}

class $$CategoryColorsTableProcessedTableManager extends ProcessedTableManager<
    _$LocalDatabase,
    $CategoryColorsTable,
    CategoryColor,
    $$CategoryColorsTableFilterComposer,
    $$CategoryColorsTableOrderingComposer,
    $$CategoryColorsTableProcessedTableManager,
    $$CategoryColorsTableInsertCompanionBuilder,
    $$CategoryColorsTableUpdateCompanionBuilder> {
  $$CategoryColorsTableProcessedTableManager(super.$state);
}

class $$CategoryColorsTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $CategoryColorsTable> {
  $$CategoryColorsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get hexCode => $state.composableBuilder(
      column: $state.table.hexCode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CategoryColorsTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $CategoryColorsTable> {
  $$CategoryColorsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get hexCode => $state.composableBuilder(
      column: $state.table.hexCode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$LocalDatabaseManager {
  final _$LocalDatabase _db;
  _$LocalDatabaseManager(this._db);
  $$SchedulesTableTableManager get schedules =>
      $$SchedulesTableTableManager(_db, _db.schedules);
  $$CategoryColorsTableTableManager get categoryColors =>
      $$CategoryColorsTableTableManager(_db, _db.categoryColors);
}
