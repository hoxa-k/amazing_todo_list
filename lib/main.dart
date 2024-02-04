import 'dart:async';
import 'dart:isolate';

import 'package:amazing_todo_list/internal/app_logger.dart';
import 'package:amazing_todo_list/internal/ioc.dart';
import 'package:amazing_todo_list/presentation/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {


  FlutterError.onError = (details) {
    _onError(details.exception, details.stack ?? StackTrace.current);
  };

  if (!kDebugMode) {
    ErrorWidget.builder = (details) {
      _onError(details.exception, details.stack ?? StackTrace.current);

      return Scaffold(body: Container());
    };
  }

  Isolate.current.addErrorListener(RawReceivePort((dynamic pair) async {
    if (pair is List<dynamic>) {
      final errorAndStacktrace = pair;
      _onError(
        errorAndStacktrace.first as Object,
        errorAndStacktrace.last as StackTrace,
      );
    }
  }).sendPort);

  runZonedGuarded(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      await registerInjections();
      runApp(const TODOListApp());
    },
    _onError,
  );
}

Future<void> _onError(Object error, StackTrace stackTrace) async {
  ioC.get<AppLogger>().logError('Error from main');
}
