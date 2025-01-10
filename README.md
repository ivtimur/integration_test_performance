# Integration test performance

- To run the test:
```shell
flutter drive --driver=test_driver/perf_driver.dart --target=integration_test/chat_screen_list_test.dart --profile --no-dds
flutter drive --driver=test_driver/perf_driver.dart --target=integration_test/chat_screen_iterable_test.dart --profile --no-dds
```

# Result
- See result at:
[link](./build/scrolling_timeline_iterable.timeline_summary.json)
[link](./build/scrolling_timeline_list.timeline_summary.json)
