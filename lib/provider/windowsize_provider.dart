import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WindowSize {
  WindowSize({required this.width, required this.height});

  double width;
  double height;
}

class WindowSizeNotifier extends ChangeNotifier {
  final windowSize = WindowSize(width: 400, height: 890);

  void changeSize(Size newSize) {
    windowSize.height = newSize.height;
    windowSize.width = newSize.width;
    notifyListeners();
  }
}

final windowSizeProvider = ChangeNotifierProvider<WindowSizeNotifier>((ref) {
  return WindowSizeNotifier();
});
