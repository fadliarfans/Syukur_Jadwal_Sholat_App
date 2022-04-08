// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'data/models/my_jadwal_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(2, 7888341556822457650),
      name: 'MyJadwalEntity',
      lastPropertyId: const IdUid(9, 618685313964281150),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3708165041091587090),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6067497767938558431),
            name: 'fajr',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5002707604680362596),
            name: 'dhuhr',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 754985194805823234),
            name: 'asr',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 811314705086216647),
            name: 'maghrib',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 3807032674351776247),
            name: 'isha',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 3536834669417076785),
            name: 'day',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 6544713804747066858),
            name: 'month',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 618685313964281150),
            name: 'year',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 7888341556822457650),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [8662189499658663189],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        6091845605010511242,
        4032107880462764156,
        6004911956594929236,
        6295669353477327685
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    MyJadwalEntity: EntityDefinition<MyJadwalEntity>(
        model: _entities[0],
        toOneRelations: (MyJadwalEntity object) => [],
        toManyRelations: (MyJadwalEntity object) => {},
        getId: (MyJadwalEntity object) => object.id,
        setId: (MyJadwalEntity object, int id) {
          object.id = id;
        },
        objectToFB: (MyJadwalEntity object, fb.Builder fbb) {
          final fajrOffset = fbb.writeString(object.fajr);
          final dhuhrOffset = fbb.writeString(object.dhuhr);
          final asrOffset = fbb.writeString(object.asr);
          final maghribOffset = fbb.writeString(object.maghrib);
          final ishaOffset = fbb.writeString(object.isha);
          fbb.startTable(10);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, fajrOffset);
          fbb.addOffset(2, dhuhrOffset);
          fbb.addOffset(3, asrOffset);
          fbb.addOffset(4, maghribOffset);
          fbb.addOffset(5, ishaOffset);
          fbb.addInt64(6, object.day);
          fbb.addInt64(7, object.month);
          fbb.addInt64(8, object.year);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = MyJadwalEntity()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..fajr = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 6, '')
            ..dhuhr = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 8, '')
            ..asr = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 10, '')
            ..maghrib = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 12, '')
            ..isha = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 14, '')
            ..day = const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0)
            ..month =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0)
            ..year =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 20, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [MyJadwalEntity] entity fields to define ObjectBox queries.
class MyJadwalEntity_ {
  /// see [MyJadwalEntity.id]
  static final id =
      QueryIntegerProperty<MyJadwalEntity>(_entities[0].properties[0]);

  /// see [MyJadwalEntity.fajr]
  static final fajr =
      QueryStringProperty<MyJadwalEntity>(_entities[0].properties[1]);

  /// see [MyJadwalEntity.dhuhr]
  static final dhuhr =
      QueryStringProperty<MyJadwalEntity>(_entities[0].properties[2]);

  /// see [MyJadwalEntity.asr]
  static final asr =
      QueryStringProperty<MyJadwalEntity>(_entities[0].properties[3]);

  /// see [MyJadwalEntity.maghrib]
  static final maghrib =
      QueryStringProperty<MyJadwalEntity>(_entities[0].properties[4]);

  /// see [MyJadwalEntity.isha]
  static final isha =
      QueryStringProperty<MyJadwalEntity>(_entities[0].properties[5]);

  /// see [MyJadwalEntity.day]
  static final day =
      QueryIntegerProperty<MyJadwalEntity>(_entities[0].properties[6]);

  /// see [MyJadwalEntity.month]
  static final month =
      QueryIntegerProperty<MyJadwalEntity>(_entities[0].properties[7]);

  /// see [MyJadwalEntity.year]
  static final year =
      QueryIntegerProperty<MyJadwalEntity>(_entities[0].properties[8]);
}
