import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:toggle_button_cmbg9l/components/button_widget.dart'
    as toggle_button_cmbg9l;
import 'package:toggle_button_cmbg9l/flutter_flow/flutter_flow_util.dart'
    as toggle_button_cmbg9l_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? uploadedAudio;

  ///  State fields for stateful widgets in this page.

  // State field(s) for transcription widget.
  FocusNode? transcriptionFocusNode;
  TextEditingController? transcriptionTextController;
  String? Function(BuildContext, String?)? transcriptionTextControllerValidator;
  // State field(s) for translationTextFieldBottom widget.
  FocusNode? translationTextFieldBottomFocusNode;
  TextEditingController? translationTextFieldBottomTextController;
  String? Function(BuildContext, String?)?
      translationTextFieldBottomTextControllerValidator;
  // State field(s) for LanguageDropDown widget.
  String? languageDropDownValue;
  FormFieldController<String>? languageDropDownValueController;
  // Model for Button component.
  late toggle_button_cmbg9l.ButtonModel buttonModel;
  AudioRecorder? audioRecorder;
  String? buttonAudioFile;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Custom Action - convertAudioPathToUploadedFile] action in Button widget.
  FFUploadedFile? englishAudioRecord;
  // Stores action output result for [Backend Call - API (Groq Whisper Translation)] action in Button widget.
  ApiCallResponse? transcribedEnglishRecord;
  // Stores action output result for [Backend Call - API (Groq Completion)] action in Button widget.
  ApiCallResponse? groqCompletionResultRecord;
  // Stores action output result for [Custom Action - convertAudioPathToUploadedFile] action in Button widget.
  FFUploadedFile? audioFileRecord;
  // Stores action output result for [Backend Call - API (Groq Whisper Translation)] action in Button widget.
  ApiCallResponse? groqTranscriptionResponseRecord;

  @override
  void initState(BuildContext context) {
    buttonModel = toggle_button_cmbg9l_util.createModel(
        context, () => toggle_button_cmbg9l.ButtonModel());
  }

  @override
  void dispose() {
    transcriptionFocusNode?.dispose();
    transcriptionTextController?.dispose();

    translationTextFieldBottomFocusNode?.dispose();
    translationTextFieldBottomTextController?.dispose();

    buttonModel.dispose();
  }
}
