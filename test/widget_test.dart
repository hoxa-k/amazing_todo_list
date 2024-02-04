import 'package:amazing_todo_list/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Find appbar', (WidgetTester tester) async {
    await tester.pumpWidget(const TODOListApp());
    expect(find.widgetWithText(AppBar, 'Список дел'), findsOneWidget);
  });
  testWidgets('Find listview and actionButton on page', (WidgetTester tester) async {
    await tester.pumpWidget(const TODOListApp());
      expect(find.byType(ListView), findsOneWidget);
      expect(find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
  });
}
