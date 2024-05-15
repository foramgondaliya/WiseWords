import 'package:flutter/material.dart';
import 'package:wisewords/screens/edit_Page.dart';
import 'package:wisewords/screens/favourite_Page.dart';
import 'package:wisewords/screens/homePage.dart';
import 'package:wisewords/screens/detail_Page.dart';
import 'package:wisewords/screens/morePage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => home_Page(),
        'detailPage': (context) => detail_page(),
        'favouritePage': (context) => favourite_Page(),
        'editPage': (context) => EditPage(),
        'more': (context) => morePage(),
      },
    ),
  );
}
