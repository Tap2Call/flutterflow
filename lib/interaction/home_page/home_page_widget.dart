import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:toggle_button_cmbg9l/components/button_widget.dart'
    as toggle_button_cmbg9l;
import 'package:toggle_button_cmbg9l/flutter_flow/flutter_flow_util.dart'
    as toggle_button_cmbg9l_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:ff_commons/api_requests/api_streaming.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.transcriptionTextController ??=
        TextEditingController(text: FFAppState().transcription);
    _model.transcriptionFocusNode ??= FocusNode();

    _model.translationTextFieldBottomTextController ??=
        TextEditingController(text: FFAppState().translatedChunks);
    _model.translationTextFieldBottomFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 30.0, 12.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Opacity(
                          opacity: valueOrDefault<double>(
                            _model.transcriptionTextController.text !=
                                        ''
                                ? 1.0
                                : 0.0,
                            0.0,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _model.transcriptionTextController,
                                        focusNode:
                                            _model.transcriptionFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Open Sans',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        maxLines: 15,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .transcriptionTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: AnimatedOpacity(
                          opacity: valueOrDefault<double>(
                            FFAppState().translatedChunks != ''
                                ? 1.0
                                : 0.0,
                            0.0,
                          ),
                          duration: 1200.0.ms,
                          curve: Curves.easeInOut,
                          child: Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _model
                                            .translationTextFieldBottomTextController,
                                        focusNode: _model
                                            .translationTextFieldBottomFocusNode,
                                        autofocus: false,
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Open Sans',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        maxLines: 15,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .translationTextFieldBottomTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 60.0))
                        .addToStart(SizedBox(height: 16.0))
                        .addToEnd(SizedBox(height: 16.0)),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    height: 200.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 30.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.languageDropDownValueController ??=
                                        FormFieldController<String>(
                                  _model.languageDropDownValue ??=
                                      FFAppState().lastSelectedLanguage,
                                ),
                                options: List<String>.from([
                                  'af',
                                  'ar',
                                  'hy',
                                  'az',
                                  'be',
                                  'bs',
                                  'bg',
                                  'ca',
                                  'zh',
                                  'hr',
                                  'cs',
                                  'da',
                                  'nl',
                                  'et',
                                  'fi',
                                  'fr',
                                  'gl',
                                  'de',
                                  'el',
                                  'he',
                                  'hi',
                                  'hu',
                                  'is',
                                  'id',
                                  'it',
                                  'ja',
                                  'kn',
                                  'kk',
                                  'ko',
                                  'lv',
                                  'lt',
                                  'mk',
                                  'ms',
                                  'mr',
                                  'mi',
                                  'ne',
                                  'no',
                                  'fa',
                                  'pl',
                                  'pt',
                                  'ro',
                                  'ru',
                                  'sr',
                                  'sk',
                                  'sl',
                                  'es',
                                  'sw',
                                  'sv',
                                  'tl',
                                  'ta',
                                  'th',
                                  'tr',
                                  'uk',
                                  'ur',
                                  'vi',
                                  'cy'
                                ]),
                                optionLabels: [
                                  'Afrikaans',
                                  'Arabic',
                                  'Armenian',
                                  'Azerbaijani',
                                  'Belarusian',
                                  'Bosnian',
                                  'Bulgarian',
                                  'Catalan',
                                  'Chinese',
                                  'Croatian',
                                  'Czech',
                                  'Danish',
                                  'Dutch',
                                  'Estonian',
                                  'Finnish',
                                  'French',
                                  'Galician',
                                  'German',
                                  'Greek',
                                  'Hebrew',
                                  'Hindi',
                                  'Hungarian',
                                  'Icelandic',
                                  'Indonesian',
                                  'Italian',
                                  'Japanese',
                                  'Kannada',
                                  'Kazakh',
                                  'Korean',
                                  'Latvian',
                                  'Lithuanian',
                                  'Macedonian',
                                  'Malay',
                                  'Marathi',
                                  'Maori',
                                  'Nepali',
                                  'Norwegian',
                                  'Persian',
                                  'Polish',
                                  'Portuguese',
                                  'Romanian',
                                  'Russian',
                                  'Serbian',
                                  'Slovak',
                                  'Slovenian',
                                  'Spanish',
                                  'Swahili',
                                  'Swedish',
                                  'Tagalog',
                                  'Tamil',
                                  'Thai',
                                  'Turkish',
                                  'Ukrainian',
                                  'Urdu',
                                  'Vietnamese',
                                  'Welsh'
                                ],
                                onChanged: (val) async {
                                  safeSetState(
                                      () => _model.languageDropDownValue = val);
                                  FFAppState().lastSelectedLanguage =
                                      _model.languageDropDownValue!;
                                  safeSetState(() {});
                                },
                                height: 50.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                searchTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Open Sans',
                                      letterSpacing: 0.0,
                                    ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                hintText: 'Help Me Translate...',
                                searchHintText: 'Search...',
                                searchCursorColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 12.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: true,
                                isMultiSelect: false,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: toggle_button_cmbg9l_util.wrapWithModel(
                                model: _model.buttonModel,
                                updateCallback: () => safeSetState(() {}),
                                child: toggle_button_cmbg9l.ButtonWidget(
                                  icon: Icon(
                                    Icons.mic,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                  onToggle: (toggle) async {
                                    if (toggle) {
                                      await startAudioRecording(
                                        context,
                                        audioRecorder: _model.audioRecorder ??=
                                            AudioRecorder(),
                                      );
                                    } else {
                                      await stopAudioRecording(
                                        audioRecorder: _model.audioRecorder,
                                        audioName: 'recordedFileBytes',
                                        onRecordingComplete:
                                            (audioFilePath, audioBytes) {
                                          _model.buttonAudioFile =
                                              audioFilePath;
                                          _model.recordedFileBytes = audioBytes;
                                        },
                                      );

                                      await Future.wait([
                                        Future(() async {
                                          _model.englishAudioRecord =
                                              await actions
                                                  .convertAudioPathToUploadedFile(
                                            _model.buttonAudioFile!,
                                          );
                                          _model.transcribedEnglishRecord =
                                              await GroqWhisperTranslationCall
                                                  .call(
                                            file: _model.englishAudioRecord,
                                            model: 'whisper-large-v3',
                                            token: FFAppState().groqApiKey,
                                          );

                                          if ((_model.transcribedEnglishRecord
                                                  ?.succeeded ??
                                              true)) {
                                            _model.groqCompletionResultRecord =
                                                await GroqCompletionCall.call(
                                              language: valueOrDefault<String>(
                                                _model.languageDropDownValue !=
                                                            null &&
                                                        _model.languageDropDownValue !=
                                                            ''
                                                    ? _model
                                                        .languageDropDownValue
                                                    : 'English',
                                                'Spanish',
                                              ),
                                              model: 'llama-3.3-70b-versatile',
                                              textToTranslate:
                                                  GroqWhisperResponseStruct
                                                          .maybeFromMap((_model
                                                                  .transcribedEnglishRecord
                                                                  ?.jsonBody ??
                                                              ''))
                                                      ?.text,
                                              token: FFAppState().groqApiKey,
                                            );
                                            if (_model
                                                    .groqCompletionResultRecord
                                                    ?.succeeded ??
                                                true) {
                                              _model.groqCompletionResultRecord
                                                  ?.streamedResponse?.stream
                                                  .transform(utf8.decoder)
                                                  .transform(
                                                      const LineSplitter())
                                                  .transform(
                                                      ServerSentEventLineTransformer())
                                                  .map((m) =>
                                                      ResponseStreamMessage(
                                                          message: m))
                                                  .listen(
                                                (onMessageInput) async {
                                                  FFAppState()
                                                          .translatedChunks =
                                                      '${FFAppState().translatedChunks}${getJsonField(
                                                    onMessageInput
                                                        .serverSentEvent
                                                        .jsonData,
                                                    r'''$.choices[0].delta.content''',
                                                  ).toString()}';
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model.transcriptionTextController
                                                            ?.text =
                                                        FFAppState()
                                                            .translatedChunks;
                                                  });
                                                },
                                                onError:
                                                    (onErrorInput) async {},
                                                onDone: () async {},
                                              );
                                            }
                                          }
                                        }),
                                        Future(() async {
                                          _model.audioFileRecord = await actions
                                              .convertAudioPathToUploadedFile(
                                            _model.buttonAudioFile!,
                                          );
                                          _model.groqTranscriptionResponseRecord =
                                              await GroqWhisperTranslationCall
                                                  .call(
                                            file: _model.audioFileRecord,
                                            model: 'whisper-large-v3',
                                            token: FFAppState().groqApiKey,
                                          );

                                          if ((_model
                                                  .groqTranscriptionResponseRecord
                                                  ?.succeeded ??
                                              true)) {
                                            safeSetState(() {
                                              _model
                                                  .translationTextFieldBottomTextController
                                                  ?.text = GroqWhisperResponseStruct
                                                      .maybeFromMap((_model
                                                              .groqTranscriptionResponseRecord
                                                              ?.jsonBody ??
                                                          ''))!
                                                  .text;
                                            });
                                          }
                                        }),
                                      ]);
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.refresh,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        FFAppState().translatedChunks = '';
                        FFAppState().transcription = '';
                        safeSetState(() {
                          _model.transcriptionTextController?.clear();
                          _model.translationTextFieldBottomTextController
                              ?.clear();
                        });

                        context.goNamed(
                          'HomePage',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 1200),
                            ),
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
