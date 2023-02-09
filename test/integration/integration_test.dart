import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:sample_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("Page Integration Tests", () {
    testWidgets("1. ボタンを押した際にカウントが1つ増加する", (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
      expect(find.byKey(const Key('top_page_msg')), findsOneWidget);

      final Finder inc = find.byTooltip("0");
      await tester.tap(inc);

      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
    });
  });
}
