// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroqWhisperResponseStruct extends BaseStruct {
  GroqWhisperResponseStruct({
    String? text,
    XGroqStruct? xGroq,
  })  : _text = text,
        _xGroq = xGroq;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "x_groq" field.
  XGroqStruct? _xGroq;
  XGroqStruct get xGroq => _xGroq ?? XGroqStruct();
  set xGroq(XGroqStruct? val) => _xGroq = val;

  void updateXGroq(Function(XGroqStruct) updateFn) {
    updateFn(_xGroq ??= XGroqStruct());
  }

  bool hasXGroq() => _xGroq != null;

  static GroqWhisperResponseStruct fromMap(Map<String, dynamic> data) =>
      GroqWhisperResponseStruct(
        text: data['text'] as String?,
        xGroq: data['x_groq'] is XGroqStruct
            ? data['x_groq']
            : XGroqStruct.maybeFromMap(data['x_groq']),
      );

  static GroqWhisperResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? GroqWhisperResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'x_groq': _xGroq?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'x_groq': serializeParam(
          _xGroq,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static GroqWhisperResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GroqWhisperResponseStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        xGroq: deserializeStructParam(
          data['x_groq'],
          ParamType.DataStruct,
          false,
          structBuilder: XGroqStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GroqWhisperResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GroqWhisperResponseStruct &&
        text == other.text &&
        xGroq == other.xGroq;
  }

  @override
  int get hashCode => const ListEquality().hash([text, xGroq]);
}

GroqWhisperResponseStruct createGroqWhisperResponseStruct({
  String? text,
  XGroqStruct? xGroq,
}) =>
    GroqWhisperResponseStruct(
      text: text,
      xGroq: xGroq ?? XGroqStruct(),
    );
