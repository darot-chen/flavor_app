import 'package:flutter/material.dart';

enum Endpoints { items, details }

class FlavorConfig {
  String? appTitle;
  String? baseUrl;
  String? imageLocation;
  ThemeData? theme;

  FlavorConfig();

  static String? getTitle() => FlavorConfig().appTitle;
  static String? getUrl() => FlavorConfig().baseUrl;
}
