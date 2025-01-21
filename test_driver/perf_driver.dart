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

        summary = driver.TimelineSummary.summarize(timeline);
      } else {
        summary =
            driver.TimelineSummary.summarize(Timeline.fromJson({'NoData': ''}));
      }

      await summary.writeTimelineToFile(
        fileName,
        destinationDirectory: './',
        pretty: true,
        includeSummary: true,
      );
    },
  );
}
