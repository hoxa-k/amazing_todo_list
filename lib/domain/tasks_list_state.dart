import 'package:amazing_todo_list/data/task_item_model.dart';
import 'package:mobx/mobx.dart';

part 'tasks_list_state.g.dart';

///Состояние для экрана списка задач.
class TasksListState extends TasksListStateBase with _$TasksListState {
  ///Создание стартового состония экрана списка задач. Список инициализируется значением <TaskItemModel>[].
  TasksListState();
}

abstract class TasksListStateBase with Store {
  /// Список задач.
  @observable
  List<TaskItemModel> list = [];

  /// Добавление элемента в список.
  ///
  /// Параметр типа [TaskItemModel] обязательный.
  @action
  void addTask(TaskItemModel item) {
    final newList = List.of(list);
    newList.add(item);
    list = newList;
  }

  /// Удаление элемента из списка.
  ///
  /// Параметр типа [TaskItemModel] обязательный. Метод ничего не делает, если элемент не содержится в списке.
  @action
  void removeTask(TaskItemModel item) {
    final newList = List.of(list);
    final result = newList.remove(item);
    if (!result) return;
    list = newList;
  }

  /// Изменение статуса элемента списка.
  ///
  /// Параметр [item] обязательный.
  /// Параметр [isDone] обязательный.
  /// Метод ничего не делает, если элемент не содержится в списке.
  @action
  void markTaskAs(TaskItemModel item, {required bool isDone}) {
    final newList = List.of(list);
    final index = newList.indexOf(item);
    if (index < 0) return;
    final changedTask = item.copyWith(isDone: isDone);
    newList.remove(item);
    newList.insert(index, changedTask);
    list = newList;
  }
}
