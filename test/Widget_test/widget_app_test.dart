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
  group("Page Widget Tests", () {
    testWidgets('1. ボタンを押した際にカウントが1つ増加する', (WidgetTester tester) async {
      // Widgetのインスタンを生成 生成処理が正常にできる確認
      // main.dart
      // 特に､Scaffoldの親であるMaterialAppが必須
      await tester.pumpWidget(const MyApp());

      // Elements exists
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
      expect(find.byKey(const Key('top_page_msg')), findsOneWidget);
      // expect(find.byKey(const Key('top_page_comments_button')), findsOneWidget);
      // expect(find.byType(ElevatedButton), findsOneWidget);

      // Tap the '+' icon and trigger a frame.
      // await tester.tap(find.text("0"));
      await tester.tap(find.byKey(const Key('top_page_msg')));
      // pump = Widgetの再生成
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);
    });
    testWidgets("2. 追加アイコンを押すとカウントが2つ増加する", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('2'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });

    testWidgets("3. Commentsボタンを押すと画面遷移する", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      // ボタンをクリックして画面遷移する
      await tester.tap(find.byKey(const Key('top_page_comments_button')));
      // 完全に画面遷移するまで待つ
      await tester.pumpAndSettle();
      // 画面遷移後のウィジェットを確認する｡
      expect(find.text("Comments Screen"), findsOneWidget);
      expect(find.text("Hello World"), findsOneWidget);
      expect(find.text("comment"), findsOneWidget);
      expect(find.byKey(const Key("hello_world")), findsOneWidget);
    });

    testWidgets("4. Comment画面にて文字入力をする", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      // ボタンをクリックして画面遷移する
      await tester.tap(find.byKey(const Key('top_page_comments_button')));
      // 完全に画面遷移するまで待つ
      await tester.pumpAndSettle();
      // 画面遷移後に入力する
      await tester.enterText(find.byKey(const Key('comment')), "ありがとう");
    });
  });
}
