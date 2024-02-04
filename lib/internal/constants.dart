/// Константы приложения.
class Constants {
   final appName = 'Amazing TODO list';
   final listPageConstants = const ListPageConstants();
   final widgetConstants = const WidgetConstants();
   const Constants();
}

/// Константы страницы списка.
class ListPageConstants {
   final pageName = 'Список задач';
   final addButtonTooltip = 'Добавить новую задачу';
   final addTaskDialogHeader = 'Добавить новую задачу';

   const ListPageConstants();
}

/// Общие константы для виджетов.
class WidgetConstants {
   final add = 'Добавить';
   final cancel = 'Отменить';

   const WidgetConstants();
}