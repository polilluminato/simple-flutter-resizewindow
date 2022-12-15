// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:simple_flutter_resizewindow/enums/windowsize_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_flutter_resizewindow/provider/windowsize_provider.dart';
import 'package:window_manager/window_manager.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  void _changeWindowSize(WindowSizeEnum windowSize) {
    switch (windowSize) {
      case WindowSizeEnum.mobilePortrait:
        //Display 2400x1080, Pixel 7
        windowManager.setSize(const Size(400, 890));
        break;
      case WindowSizeEnum.mobileLandscape:
        windowManager.setSize(const Size(890, 400));
        break;
      case WindowSizeEnum.tabletPortrait:
        windowManager.setSize(const Size(607, 874));
        break;
      case WindowSizeEnum.tabletLandscape:
        windowManager.setSize(const Size(874, 607));
        break;
      case WindowSizeEnum.desktop:
        windowManager.setSize(const Size(1440, 900));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WindowSize windowSize = ref.watch(windowSizeProvider);
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    void actionChangeWindowSize(WindowSizeEnum windowSizeEnum) {
      _changeWindowSize(windowSizeEnum);
      ref.read(windowSizeProvider.notifier).changeSize(
            WindowSize(
                width: windowSizeEnum.width, height: windowSizeEnum.height),
          );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.primary,
        title: Text(
          "Simple Flutter Resize Window",
          style: TextStyle(
            color: themeData.colorScheme.onPrimary,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: themeData.colorScheme.onPrimary,
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  onTap: () =>
                      actionChangeWindowSize(WindowSizeEnum.mobilePortrait),
                  child: const Text('Mobile Portrait'),
                ),
                PopupMenuItem(
                  onTap: () =>
                      actionChangeWindowSize(WindowSizeEnum.mobileLandscape),
                  child: const Text('Mobile Landscape'),
                ),
                PopupMenuItem(
                  onTap: () =>
                      actionChangeWindowSize(WindowSizeEnum.tabletPortrait),
                  child: const Text('Tablet Portrait'),
                ),
                PopupMenuItem(
                  onTap: () =>
                      actionChangeWindowSize(WindowSizeEnum.tabletLandscape),
                  child: const Text('Tablet Landscape'),
                ),
                PopupMenuItem(
                  onTap: () => actionChangeWindowSize(WindowSizeEnum.desktop),
                  child: const Text('Desktop'),
                ),
              ];
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          "Window Size\n${windowSize.width.toInt()}x${windowSize.height.toInt()}",
          textAlign: TextAlign.center,
          style: textTheme.headline4,
        ),
      ),
    );
  }
}
