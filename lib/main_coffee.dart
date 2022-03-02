import 'package:flavor_app/flavor_config.dart';
import 'package:flavor_app/main_common.dart';
import 'package:flutter/material.dart';

void main() {
  // Inject our own configurations
  // Coffee Beans

  mainCommon(
    FlavorConfig()
      ..appTitle = "Coffee"
      ..baseUrl = "https://randomuser.me/api/"
      ..imageLocation = "assets/images/coffee_bean.jpg"
      ..theme = ThemeData.light().copyWith(
        primaryColor: Color(0xFF123456),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(backgroundColor: Color(0xFF654321)),
      ),
  );
}
