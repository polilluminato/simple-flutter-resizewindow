import 'package:flutter/material.dart';
import 'package:simple_flutter_resizewindow/app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
