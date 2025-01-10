import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/integration_test_driver.dart';

const scrollingTimelineList = 'scrolling_timeline_list';
const scrollingTimelineIterable = 'scrolling_timeline_iterable';

Future<void> main() {
  return integrationDriver(
    responseDataCallback: (data) async {
      Object? dataTest;
      final String fileName;

      if (data?[scrollingTimelineList] != null) {
        dataTest = data?[scrollingTimelineList];
        fileName = scrollingTimelineList;
      } else if (data?[scrollingTimelineIterable] != null) {
        dataTest = data?[scrollingTimelineIterable];
        fileName = scrollingTimelineIterable;
      } else {
        fileName = 'no_data';
      }

      TimelineSummary summary;

      if (dataTest is Map<String, dynamic>) {
        final timeline = driver.Timeline.fromJson(dataTest);

        // Convert the Timeline into a TimelineSummary that's easier to
        // read and understand.
        summary = driver.TimelineSummary.summarize(timeline);
      } else {
        summary =
            driver.TimelineSummary.summarize(Timeline.fromJson({'NoData': ''}));
      }

      // Then, write the entire timeline to disk in a json format.
      // This file can be opened in the Chrome browser's tracing tools
      // found by navigating to chrome://tracing.
      // Optionally, save the summary to disk by setting includeSummary
      // to true

      await summary.writeTimelineToFile(
        fileName,
        pretty: true,
        includeSummary: true,
      );
    },
  );
}
