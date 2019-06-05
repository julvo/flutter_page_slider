import 'package:flutter/material.dart';
import 'package:page_slider/page_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<PageSliderState> _slider = GlobalKey();

  Widget _card(String text) =>
    Card(
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(100),
        child: Text(
          text, 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          )
        ),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Page Slider Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            PageSlider(
              key: _slider,
              duration: Duration(milliseconds: 400),
              pages: <Widget>[
                _card('First Page'),
                _card('Second Page'),
                _card('Third Page'),
                _card('Fourth Page'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(Icons.arrow_back_ios),
                  onPressed: () => _slider.currentState.previous(),
                ),
                FloatingActionButton(
                  child: Icon(Icons.arrow_forward_ios),
                  onPressed: () => _slider.currentState.next(),
                ),
              ],
            ),
            MaterialButton(
              // jump to zero-indexed page number
              onPressed: () => _slider.currentState.setPage(3),
              child: Text('Go to last page'),
            ),
          ],
        ),
      ),
    );
  }
}
