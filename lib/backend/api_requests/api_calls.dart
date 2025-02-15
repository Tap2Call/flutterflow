import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GroqCompletionCall {
  static Future<ApiCallResponse> call({
    String? language = 'English',
    String? model = 'llama-3.3-70b-versatile',
    String? textToTranslate = 'Something went wrong',
    String? token = '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',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "${escapeStringForJson(model)}",
  "messages": [
    {
      "role": "system",
      "content": "Translate the following text into ${escapeStringForJson(language)}. Don't include any explanation, Just provide the translation - ${escapeStringForJson(textToTranslate)}"
    }
  ],
  "stream": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Groq Completion',
      apiUrl: 'https://api.groq.com/openai/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'multipart/form-data',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }

  static String? translatedText(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class GroqWhisperTranslationCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? model = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Groq Whisper Translation',
      apiUrl: 'https://api.groq.com/openai/v1/audio/translations',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'file': file,
        'model': model,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GroqWhisperTranscriptionCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? model = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Groq Whisper Transcription',
      apiUrl: 'https://api.groq.com/openai/v1/audio/transcriptions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'file': file,
        'model': model,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
