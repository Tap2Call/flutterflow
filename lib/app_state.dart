import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _lastSelectedLanguage =
          await secureStorage.getString('ff_lastSelectedLanguage') ??
              _lastSelectedLanguage;
    });
    await _safeInitAsync(() async {
      _groqApiKey =
          await secureStorage.getString('ff_groqApiKey') ?? _groqApiKey;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _translatedChunks = '';
  String get translatedChunks => _translatedChunks;
  set translatedChunks(String value) {
    _translatedChunks = value;
  }

  String _transcription = '';
  String get transcription => _transcription;
  set transcription(String value) {
    _transcription = value;
  }

  String _lastSelectedLanguage = '';
  String get lastSelectedLanguage => _lastSelectedLanguage;
  set lastSelectedLanguage(String value) {
    _lastSelectedLanguage = value;
    secureStorage.setString('ff_lastSelectedLanguage', value);
  }

  void deleteLastSelectedLanguage() {
    secureStorage.delete(key: 'ff_lastSelectedLanguage');
  }

  String _groqApiKey = '';
  String get groqApiKey => _groqApiKey;
  set groqApiKey(String value) {
    _groqApiKey = value;
    secureStorage.setString('ff_groqApiKey', value);
  }

  void deleteGroqApiKey() {
    secureStorage.delete(key: 'ff_groqApiKey');
  }

  String _gskBaEq9qEdatjs35PdTDtQWGdyb3FYosFnxQE2X1kcDNcZcHblF0Ia = '';
  String get gskBaEq9qEdatjs35PdTDtQWGdyb3FYosFnxQE2X1kcDNcZcHblF0Ia =>
      _gskBaEq9qEdatjs35PdTDtQWGdyb3FYosFnxQE2X1kcDNcZcHblF0Ia;
  set gskBaEq9qEdatjs35PdTDtQWGdyb3FYosFnxQE2X1kcDNcZcHblF0Ia(String value) {
    _gskBaEq9qEdatjs35PdTDtQWGdyb3FYosFnxQE2X1kcDNcZcHblF0Ia = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
