import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:f4_danhba/main.dart';

void main() {
  testWidgets('search returns selected contact and opens its details', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byTooltip('Tìm kiếm'));
    await tester.pumpAndSettle();

    expect(find.text('Tìm kiếm liên hệ'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'Trần Thị B');
    await tester.pumpAndSettle();
    expect(find.text('0912345678'), findsOneWidget);

    await tester.tap(find.widgetWithText(ListTile, 'Trần Thị B'));
    await tester.pumpAndSettle();

    expect(find.byType(ContactDetailPage), findsOneWidget);
    expect(find.text('0912345678'), findsOneWidget);
    expect(find.text('Sửa'), findsOneWidget);
  });
}
