import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class WindowSize {
  const WindowSize({required this.width, required this.height});

  final double width;
  final double height;

  WindowSize copyWith({double? width, double? height}) {
    return WindowSize(
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }
}

class WindowSizeNotifier extends StateNotifier<WindowSize> {
  WindowSizeNotifier() : super(const WindowSize(width: 400, height: 890));

  void changeSize(WindowSize windowSize) {
    state = windowSize;
  }
}

final windowSizeProvider =
    StateNotifierProvider<WindowSizeNotifier, WindowSize>((ref) {
  return WindowSizeNotifier();
});
