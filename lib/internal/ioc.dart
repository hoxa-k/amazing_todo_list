
import 'package:amazing_todo_list/internal/constants.dart';
import 'package:get_it/get_it.dart';

import 'app_logger.dart';

/// Ссылка на контейнер с зависимостями приложения.
final ioC = GetIt.instance;

/// Регистрация зависимостей приложения.
Future<void> registerInjections() async {
  ioC.registerSingleton<AppLogger>(AppLoggerImpl());
  ioC.registerSingleton<Constants>(const Constants());
}