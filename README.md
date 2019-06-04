# flutter_page_slider

[![Pub](https://img.shields.io/pub/v/page_slider.svg)](https://pub.dev/packages/page_slider)

A flutter widget that slides through pages horizontally

## Getting Started

First, create the `PageSlider` widget with a `GlobalKey<PageSliderState>` and the child widgets which you want to slide through. Then, control the active page using a global key to address the page slider state like so:

```dart
class Demo extends StatefulWidget {
  Demo({Key key}) : super(key: key);
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  GlobalKey<PageSliderState> _sliderKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageSlider(
          key: _sliderKey,
          pages: [
            Text('Page 0'),
            Text('Page 1'),
            Text('Page 2'),
          ]
        ),
        RaisedButton(
          onPressed: _sliderKey.currentState.next,
          child: Text('Next')
        ),
        RaisedButton(
          onPressed: _sliderKey.currentState.previous,
          child: Text('Previous')
        ),
      ]
    );
  }
}
```
