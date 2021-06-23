import 'package:devquiz/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Home Page Test", () {
    testWidgets('Home Page', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // await tester.pumpAndSettle();
      // expect(find.byType(AppBarWidget), findsOneWidget);
    });
  });
}
