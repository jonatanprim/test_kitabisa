import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:testaja1/main.dart';
import 'package:testaja1/pages/webview_page.dart';

void main() {

  group('Test HomePage', (){
    testWidgets('Test campaign text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MyApp(),
      );
      await tester.pump();
      final text = find.text('Campaigns');
      expect(text, findsOneWidget);
    });

    testWidgets('Test title text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MyApp(),
      );
      await tester.pump();
      final text = find.text('Kitabisa');
      expect(text, findsOneWidget);
    });

    testWidgets('Test list campaign', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MyApp(),
      );
      await tester.pump();
      final listCampaign = find.byType(GridView);
      expect(listCampaign, findsWidgets);
    });

  });


  group('Test WebViewPage', (){
    testWidgets('Test title text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
            home: WebViewPage(url: 'https://kitabisa.com', title: 'Bantu anakku sembuh'),
          ),
      );
      await tester.pump();
      final text = find.text('Bantu anakku sembuh');
      expect(text, findsOneWidget);
    });
  });

}
