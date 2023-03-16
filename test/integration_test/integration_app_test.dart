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

      await tester.tap(find.byKey(const Key('top_page_msg')));
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
    });
    testWidgets("2. 追加アイコンを押すとカウントが2つ増加する", (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      expect(find.text('2'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });

    testWidgets("3. Commentsボタンを押すと画面遷移する", (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // ボタンをクリックして画面遷移する
      await tester.tap(find.byKey(const Key('top_page_comments_button')));
      // 完全に画面遷移するまで待つ
      await tester.pumpAndSettle();
      // 画面遷移後のウィジェットを確認する｡
      expect(find.text("Comments Screen"), findsOneWidget);
      expect(find.text("Hello World"), findsOneWidget);
      expect(find.text("comment"), findsOneWidget);
    });

    testWidgets("4. Comment画面にて文字入力をする", (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // ボタンをクリックして画面遷移する
      await tester.tap(find.byKey(const Key('top_page_comments_button')));
      // 完全に画面遷移するまで待つ
      await tester.pumpAndSettle();
      // 画面遷移後に入力する
      await tester.enterText(find.byKey(const Key('comment')), "ありがとう");
    });
  });
}
