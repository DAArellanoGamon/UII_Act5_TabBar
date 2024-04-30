import 'package:arellano0429/sliver_tab_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Material App",
      home: Scaffold(
        body: SliverTabBar(),
      ),
    );
  }
}
