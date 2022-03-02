import 'dart:convert';
import 'dart:io';

import 'package:flavor_app/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:logger/logger.dart';

var flavorConfigProvider;

void mainCommon(FlavorConfig config) {
  flavorConfigProvider = StateProvider((ref) => config);

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: FlavorConfig.getTitle() ?? '',
      theme: context.read(flavorConfigProvider).state.theme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    StateController<FlavorConfig> notifier = context.read(flavorConfigProvider);
    print(notifier.state.appTitle);
    return Scaffold(
      appBar: AppBar(
        title: Text(notifier.state.appTitle ?? 'Tittle'),
      ),
      body: FutureBuilder(
        future: getUser(notifier.state.baseUrl ?? ''),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Text(snapshot.data.toString()),
          );
        },
      ),
    );
  }

  getUser(String url) async {
    print('URL : $url');
    Response? response;
    try {
      print('DKLSF');
      response = await http.get(Uri.parse(url));
      print(response.statusCode);
    } catch (e) {
      // Logger().e(e);
      print('ERROR');
      print(e);
    }
    var json = jsonDecode(response?.body.toString() ?? '{}');
    print('RESPONSE');
    Logger().d(json);

    return json;
  }
}
