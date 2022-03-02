import 'package:flavor_app/flavor_config.dart';
import 'package:flavor_app/main_common.dart';
import 'package:flutter/material.dart';

void main() {
  // Inject our own configurations
  // Crunchy Munchy

  mainCommon(
    FlavorConfig()
      ..appTitle = "Cookie"
      ..imageLocation = "assets/images/munchy_crunchy.jpg"
      ..baseUrl = "https://randomuser.me/api/"
      ..theme = ThemeData.dark(),
  );
}
