import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_model.dart';
export 'button_model.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    required this.icon,
    required this.onToggle,
  });

  final Widget? icon;
  final Future Function(bool toggle)? onToggle;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
    with TickerProviderStateMixin {
  late ButtonModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(),
      child: Stack(
        alignment: AlignmentDirectional(0.0, 0.0),
        children: [
          if (valueOrDefault<bool>(
            _model.toggle,
            false,
          ))
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.toggle = !(_model.toggle ?? true);
                  safeSetState(() {});
                  await widget.onToggle?.call(
                    _model.toggle!,
                  );
                },
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(),
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    child: custom_widgets.CustomRippleWidget(
                      width: 200.0,
                      height: 200.0,
                      showRipple: true,
                      rippleColor: FlutterFlowTheme.of(context).tertiary,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
              ),
            ),
          if (!valueOrDefault<bool>(
            _model.toggle,
            true,
          ))
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.toggle = !(_model.toggle ?? true);
                  safeSetState(() {});
                  await widget.onToggle?.call(
                    _model.toggle!,
                  );
                },
                child: Material(
                  color: Colors.transparent,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 5.0,
                      ),
                    ),
                    child: widget!.icon!.animateOnPageLoad(
                        animationsMap['iconOnPageLoadAnimation']!),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
