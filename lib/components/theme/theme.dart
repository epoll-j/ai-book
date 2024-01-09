import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply().copyWith(
        titleLarge: ThemeData.light()
            .textTheme
            .titleLarge
            ?.copyWith(fontSize: 28, fontWeight: FontWeight.bold),
        bodyLarge: ThemeData.light()
            .textTheme
            .bodyLarge
            ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: const Color(0xFFFEF8F6),
    cupertinoOverrideTheme:
        const CupertinoThemeData(barBackgroundColor: Color(0xFFFEF8F6)),
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
        backgroundColor: const Color(0xFFFEF8F6),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: CupertinoColors.label)));

final ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply().copyWith(
        titleLarge: ThemeData.dark().textTheme.titleLarge?.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
        bodyLarge: ThemeData.light()
            .textTheme
            .bodyLarge
            ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: CupertinoColors.extraLightBackgroundGray)));
