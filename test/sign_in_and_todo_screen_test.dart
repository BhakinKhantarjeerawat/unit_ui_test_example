  import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_test/main.dart';

void main() {

    testWidgets('''
initial number is 0,
tap the "FloatingActionButton", then the number is increased to 1,
      tap the "todo" button to go to TODO screen,
       in "todo" screen the updated number appears as 1,
       tap "Reduce" button, the number is reduced to 0
       ''', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: MyApp())),
      );

      expect(find.text("0"), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.text("1"), findsOneWidget);

      await tester.tap(find.text("todo"));
      await tester.pumpAndSettle();
      expect(find.text("1"), findsOneWidget);

      await tester.tap(find.text("Reduce"));
      await tester.pumpAndSettle();
      expect(find.text("0"), findsOneWidget);
    });

  } 
   
   
   
