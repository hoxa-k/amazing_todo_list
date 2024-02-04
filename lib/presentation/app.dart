import 'package:amazing_todo_list/internal/constants.dart';
import 'package:amazing_todo_list/internal/ioc.dart';
import 'package:amazing_todo_list/presentation/screens/list_page.dart';
import 'package:flutter/material.dart';

/// Корневой виджет приложения
class TODOListApp extends StatelessWidget {
  const TODOListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ioC.get<Constants>().appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListPage(),
    );
  }
}