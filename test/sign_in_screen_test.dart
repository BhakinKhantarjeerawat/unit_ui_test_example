import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_test/main.dart';

void main() {
  group("home page screen's widget test", () {

    testWidgets('go to TodoList screen, and find the word "Reduce1',
        (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: MyApp())),
      );

      await tester.tap(find.text("todo"));
      await tester.pumpAndSettle();
      expect(find.text("Reduce1"), findsOneWidget);
    });

    testWidgets(
        'press FloatingActionButton, the number is increased progressively',
        (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: MyApp())),
      );
      // initial value is 0
      expect(find.text("0"), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.text("1"), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.text("2"), findsOneWidget);
    });

    testWidgets('presses the button, dialog appears, and find the word "CLOSE',
        (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: MyApp())),
      );

      expect(find.text("showDialog"), findsOneWidget);
      await tester.tap(find.text("showDialog"));
      await tester.pumpAndSettle();
      expect(find.text("CLOSE"), findsOneWidget);
    });
  });
}
