import 'package:flutter/material.dart';
import 'package:todo/pages/alt_home_page.dart';
import 'package:todo/screens/fullnote.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo",
      theme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/",
      routes: {
        "/": (context) => const AlternativeHome(),
        "/fullnote": (context) => FullNote(),
      },
    );
  }
}
