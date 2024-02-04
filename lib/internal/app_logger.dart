import 'package:logger/logger.dart';

/// Интерфейс для сервиса логирования в приложении.
abstract interface class AppLogger {
  void logError(String msg);

  void log(String msg);
}

/// Реализация интерфейса [AppLogger] с помощью библиотеки [Logger]
class AppLoggerImpl implements AppLogger {
  final loggerInstance = Logger(printer: PrettyPrinter());

  AppLoggerImpl();

  @override
  void log(String msg) {
    loggerInstance.d(msg);
  }

  @override
  void logError(String msg) {
    loggerInstance.e(msg);
  }
}
