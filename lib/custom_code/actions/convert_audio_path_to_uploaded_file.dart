// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

Future<FFUploadedFile?> convertAudioPathToUploadedFile(
    String audioFilePath) async {
  Uint8List? audioBytes = null;
  try {
    File file = File.fromUri(Uri.parse(audioFilePath));

    try {
      audioBytes = await file.readAsBytes();

      FFUploadedFile audioFile =
          new FFUploadedFile(bytes: audioBytes, name: "savedAudio.m4a");

      return audioFile;
    } catch (e) {
      print("Error $e");
      return null;
    }
  } catch (e) {
    print("Error $e");
    return null;
  }
}
