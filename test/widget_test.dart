// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sample_test/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    expect(find.byKey(const Key('top_page_msg')), findsOneWidget);
    expect(find.byKey(const Key('top_page_comments_button')), findsOneWidget);
    expect(find.text('Comments'), findsOneWidget);
    // expect(find.byType(ElevatedButton), findsOneWidget);

    // Tap the '+' icon and trigger a frame.

    // await tester.tap(find.text("0"));
    // await tester.tap(find.byType(ElevatedButton));
    await tester.tap(find.byKey(const Key('top_page_msg')));
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pumpAndSettle();
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });
}
