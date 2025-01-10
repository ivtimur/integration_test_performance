import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test_performance/main.dart';
import 'package:integration_test/integration_test.dart';

/// flutter drive --driver=test_driver/perf_driver.dart --target=integration_test/chat_screen_list_test.dart --profile --no-dds
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Chat screen list Scroll', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    await binding.traceAction(
      () async {
        await tester.tap(find.byKey(Key('chat_screen_list')));

        await tester.pumpAndSettle();

        final listFinder = find.byType(Scrollable);
        final itemFinder = find.byKey(Key('item_50_text'));

        // Scroll until the item to be found appears.
        await tester.scrollUntilVisible(
          itemFinder,
          500.0,
          scrollable: listFinder.first,
          maxScrolls: 51,
        );
      },
      reportKey: 'scrolling_timeline_list',
    );
  });
}
