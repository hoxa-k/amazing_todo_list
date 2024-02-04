import 'package:amazing_todo_list/data/task_item_model.dart';
import 'package:amazing_todo_list/domain/tasks_list_state.dart';
import 'package:amazing_todo_list/internal/constants.dart';
import 'package:amazing_todo_list/internal/ioc.dart';
import 'package:amazing_todo_list/presentation/widgets/list_item.dart';
import 'package:amazing_todo_list/presentation/widgets/new_item_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// Экран списка задач.
///
/// Содержит список [ListView], состоящий из [ListItem], и кнопку добавления
///  новой задачи [FloatingActionButton].
class ListPage extends StatelessWidget {
  final _pageState = TasksListState();
  final _pageConstants = ioC.get<Constants>().listPageConstants;

  ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_pageConstants.pageName),
      ),
      body: Observer(
        builder: (context) => ListView(
          children: _pageState.list
              .map(
                (e) => ListItem(
                  key: ObjectKey(e),
                  description: e.description,
                  isDone: e.isDone,
                  onDelete: () => _deleteItem(e),
                  onStatusChanged: (v) => _markItem(e, isDone: v),
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addItem(context),
        tooltip: _pageConstants.addButtonTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _deleteItem(TaskItemModel task) {
    _pageState.removeTask(task);
  }

  void _markItem(TaskItemModel task, {bool? isDone}) {
    _pageState.markTaskAs(task, isDone: isDone ?? false);
  }

  void _addItem(BuildContext context) async {
    final result = await NewItemDialog.show(
      context,
      title: _pageConstants.addTaskDialogHeader,
    );
    if (result == null) return;
    _pageState.addTask(TaskItemModel(description: result));
  }
}
