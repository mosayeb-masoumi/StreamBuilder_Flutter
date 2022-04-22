import 'package:flutter/material.dart';
import 'package:stream_builder_flutter/home_page.dart';
import 'package:stream_builder_flutter/stream_periodically_call_server/PeriodicStreamServer.dart';
import 'package:stream_builder_flutter/stream_periodically_call_server/PerodicStreamByClick.dart';
import 'package:stream_builder_flutter/stream_periodically_call_server/PerodicStreamPage.dart';
import 'package:stream_builder_flutter/strem_get_list/list-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      // home: HomePage(),
      // home: PeriodicStreamPage(),
      // home: PeriodicStreamByClick(),
      // home: PeriodicStreamServer(),
      home: ListStreamPage(),
    );
  }
}
