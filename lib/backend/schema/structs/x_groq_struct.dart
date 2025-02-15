// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class XGroqStruct extends BaseStruct {
  XGroqStruct({
    String? id,
  }) : _id = id;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static XGroqStruct fromMap(Map<String, dynamic> data) => XGroqStruct(
        id: data['id'] as String?,
      );

  static XGroqStruct? maybeFromMap(dynamic data) =>
      data is Map ? XGroqStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static XGroqStruct fromSerializableMap(Map<String, dynamic> data) =>
      XGroqStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'XGroqStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is XGroqStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

XGroqStruct createXGroqStruct({
  String? id,
}) =>
    XGroqStruct(
      id: id,
    );
