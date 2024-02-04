import 'package:flutter/material.dart';

/// Элемент списка.
///
/// Состоит из индикатора состояния (чекбокс), описания, кнопки удаления.
class ListItem extends StatelessWidget {
  /// Описание, не может быть пустым.
  final String description;
  /// Cостояние индикатора. По умолчанию устанавливается в значение false.
  final bool isDone;
  /// Обработчик кнопки удаления элемента списка. Обязательное поле.
  final void Function() onDelete;
  ///  Обработчик изменения статуса чекбокса. Обязательное поле.
  final void Function(bool?) onStatusChanged;

  /// Создание элемента списка.
  ///
  /// [description] - описание, не может быть пустым.
  /// [isDone] - состояние индикатора. По умолчанию устанавливается в значение false.
  /// [onDelete] - обработчик кнопки удаления элемента списка. Обязательное поле.
  /// [onStatusChanged] - обработчик изменения статуса чекбокса. Обязательное поле.
  const ListItem({
    super.key,
    required this.description,
    this.isDone = false,
    required this.onDelete,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: isDone,
        onChanged: onStatusChanged,
      ),
      title: Text(
        description,
        style: isDone
            ? const TextStyle(decoration: TextDecoration.lineThrough)
            : null,
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.pink,
          size: 24.0,
          semanticLabel: 'Delete task from list',
        ),
        onPressed: onDelete,
      ),
    );
  }
}
