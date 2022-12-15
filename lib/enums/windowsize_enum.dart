// ignore_for_file: file_names

enum WindowSizeEnum {
  mobilePortrait(400, 890),
  mobileLandscape(890, 400),
  tabletPortrait(607, 874),
  tabletLandscape(874, 607),
  desktop(1440, 900);

  const WindowSizeEnum(this.width, this.height);
  final double width;
  final double height;
}
