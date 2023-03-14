import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:sample_test/increments.dart';

void main() {
  testWidgets('Counter increments by tapping the button',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(home: Increments()));

    // Verify that the counter starts at 0
    expect(find.text('0'), findsOneWidget);

    // Tap the button and trigger a frame
    await tester.tap(find.byKey(const Key('top_page_msg')));
    await tester.pump();

    // Verify that the counter has incremented
    expect(find.text('1'), findsOneWidget);
  });
}
