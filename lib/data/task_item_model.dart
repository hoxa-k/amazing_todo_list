import 'package:equatable/equatable.dart';

/// Модель задачи.
///
/// Сравнение экземпляров класса происходит по значениям, указанным в геттере [props].
class TaskItemModel extends Equatable {
  final String description;
  final bool isDone;

  /// Создание элемента списка задач.
  ///
  /// Описание [description] - обязательное поле.
  /// [isDone] - флаг, обозначающий выполнение задания. По умолчанию устанавливается в
  /// значение false.
  const TaskItemModel({required this.description, this.isDone = false});

  /// Создание нового экземпляра класса с измененным значением. Если значания не переданы, то создается новый экземпляр
  /// класса с теми же значениями, что у текущего.
  TaskItemModel copyWith({String? description, bool? isDone}) {
    return TaskItemModel(
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [description, isDone];
}
