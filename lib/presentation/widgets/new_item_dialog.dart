import 'package:amazing_todo_list/internal/constants.dart';
import 'package:amazing_todo_list/internal/ioc.dart';
import 'package:flutter/material.dart';

/// Диалог добавления нового элемента списка задач.
///
/// Виджет диалогового окна не имеет публичного конструктора. Отображение окна
/// вызывается статическим методом [NewItemDialog.show(context)]
/// На экране диалога отображается название, поле для ввода, кнопка добавления
/// и кнопка отмены.
/// В поле для ввода могут быть введены любые символы с клавиатуры устройства.
/// Если поле для ввода пустое или введены только пробельные символы, кнопка
/// добавления заблокирована.
/// По нажатию на кнопку добавления закрывается диалог, возвращается значение
/// из поля для ввода.
/// По нажатию на кнопку отмены закрыватеся диалог, возвращается значение null.
class NewItemDialog extends StatefulWidget {
  final String title;
  const NewItemDialog._(this.title);

  /// Вызов окна добавления нового элемента списка задач.
  ///
  /// Возвращает значение [String?] из поля для ввода без пробелов в начале
  /// и конце строки. Передается обязательный параметр [title], который
  /// используется как заголовок диалогового окна.
  static Future<String?> show(BuildContext context, {required String title}) async {
    return await showDialog(
      context: context,
      builder: (context) => NewItemDialog._(title),
    );
  }

  @override
  State<NewItemDialog> createState() => _NewItemDialogState();
}

class _NewItemDialogState extends State<NewItemDialog> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isAddAvailable = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      if (!isAddAvailable && _textEditingController.text.trim().isNotEmpty) {
        setState(() => isAddAvailable = true);
      } else if (_textEditingController.text.trim().isEmpty && isAddAvailable) {
        setState(() => isAddAvailable = false);
      }
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 15),
            Text(widget.title),
            const SizedBox(height: 15),
            TextField(
              controller: _textEditingController,
              maxLines: 5,
              minLines: 1,
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: isAddAvailable ? _onAddPressed : null,
              child: Text(ioC.get<Constants>().widgetConstants.add),
            ),
            TextButton(
              onPressed: _onCancelPressed,
              child: Text(ioC.get<Constants>().widgetConstants.cancel),
            ),
          ],
        ),
      ),
    );
  }

  void _onAddPressed() {
    Navigator.pop(context, _textEditingController.text.trim());
  }

  void _onCancelPressed() {
    Navigator.pop(context);
  }
}
