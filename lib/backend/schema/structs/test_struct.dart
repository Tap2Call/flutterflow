// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestStruct extends BaseStruct {
  TestStruct({
    String? test,
  }) : _test = test;

  // "test" field.
  String? _test;
  String get test => _test ?? '';
  set test(String? val) => _test = val;

  bool hasTest() => _test != null;

  static TestStruct fromMap(Map<String, dynamic> data) => TestStruct(
        test: data['test'] as String?,
      );

  static TestStruct? maybeFromMap(dynamic data) =>
      data is Map ? TestStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'test': _test,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'test': serializeParam(
          _test,
          ParamType.String,
        ),
      }.withoutNulls;

  static TestStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestStruct(
        test: deserializeParam(
          data['test'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestStruct && test == other.test;
  }

  @override
  int get hashCode => const ListEquality().hash([test]);
}

TestStruct createTestStruct({
  String? test,
}) =>
    TestStruct(
      test: test,
    );
