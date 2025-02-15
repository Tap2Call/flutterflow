// Automatic FlutterFlow imports
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:ripple_wave/ripple_wave.dart';

class CustomRippleWidget extends StatefulWidget {
  const CustomRippleWidget({
    super.key,
    this.width,
    this.height,
    required this.showRipple,
    required this.rippleColor,
  });

  final double? width;
  final double? height;
  final bool showRipple;
  final Color rippleColor;

  @override
  State<CustomRippleWidget> createState() => _CustomRippleWidgetState();
}

class _CustomRippleWidgetState extends State<CustomRippleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 50,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (widget.showRipple)
              RippleWave(
                color: widget.rippleColor,
                child: Container(
                  width: widget.width ?? 50,
                  height: widget.height ?? 50,
                ),
              ),
            Icon(Icons.circle, size: 24, color: widget.rippleColor),
          ],
        ),
      ),
    );
  }
}
