// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:simple_flutter_resizewindow/enums/windowsize_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_flutter_resizewindow/provider/windowsize_provider.dart';
import 'package:window_manager/window_manager.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WindowSize windowSize = ref.watch(windowSizeProvider);
    final ThemeData themeData = Theme.of(context);

    void actionChangeWindowSize(WindowSizeEnum windowSizeEnum) {
      windowManager.setSize(
        Size(
          windowSizeEnum.width,
          windowSizeEnum.height,
        ),
      );

      ref.read(windowSizeProvider.notifier).changeSize(
            WindowSize(
              width: windowSizeEnum.width,
              height: windowSizeEnum.height,
            ),
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
                for (WindowSizeEnum singleWindowSizeEnum
                    in WindowSizeEnum.values)
                  PopupMenuItem(
                    onTap: () => actionChangeWindowSize(singleWindowSizeEnum),
                    child: Text(singleWindowSizeEnum.description),
                  )
              ];
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          "Window Size\n${windowSize.width.toInt()}x${windowSize.height.toInt()}",
          textAlign: TextAlign.center,
          style: themeData.textTheme.headline4,
        ),
      ),
    );
  }
}
