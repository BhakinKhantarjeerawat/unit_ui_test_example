import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_test/scrolling.dart';

void main() {
  testWidgets('finds a deep item in a long list', (tester) async {
    await tester.pumpWidget(MyApp1(
      items: List<String>.generate(10000, (i) => 'Item $i'),
    ));

    final listFinder = find.byType(Scrollable);
    // final listFinder = find.byKey(const ValueKey('long_list'));

    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );

    expect(itemFinder, findsOneWidget);
  });
}
