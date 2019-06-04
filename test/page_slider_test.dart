import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:page_slider/page_slider.dart';

void main() {
  testWidgets('tests back and forth sliding', (WidgetTester tester) async {
    final key = GlobalKey<PageSliderState>();
    final slider = PageSlider(
      key: key,
      pages: <Widget>[
        Text('Page 0', textDirection: TextDirection.ltr),
        Text('Page 1', textDirection: TextDirection.ltr),
        Text('Page 2', textDirection: TextDirection.ltr),
        Text('Page 3', textDirection: TextDirection.ltr),
      ],
    );

    await tester.pumpWidget(slider);

    final sliderState = key.currentState;

    expect(sliderState.currentPage, 0);
    expect(sliderState.hasPrevious, false);
    expect(sliderState.hasNext, true);

    sliderState.next();
    expect(sliderState.currentPage, 1);
    expect(sliderState.hasPrevious, true);
    expect(sliderState.hasNext, true);

    sliderState.previous();
    expect(sliderState.currentPage, 0);
    expect(sliderState.hasPrevious, false);
    expect(sliderState.hasNext, true);

    sliderState.setPage(3);
    expect(sliderState.currentPage, 3);
    expect(sliderState.hasPrevious, true);
    expect(sliderState.hasNext, false);
  });
}
