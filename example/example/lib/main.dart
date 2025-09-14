import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool run = true;
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void setIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
                run = !run;
              }),
          child: Icon((run) ? Icons.stop : Icons.play_arrow)),
      drawer: Drawer(
        child: ListView(
          // padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('Simple Single Path SVG'),
              onTap: () => setIndex(0),
            ),
            ListTile(
              title: const Text('Multiple Path SVG: One by One'),
              onTap: () => setIndex(1),
            ),
            ListTile(
              title: const Text('Multiple Path SVG: All at Once'),
              onTap: () => setIndex(2),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: switch (expression) {
              pattern => value,
            }),
          ],
        ),
      ),
    );
  }
}



// body: Center(
//           child: Column(children: <Widget>[
//         //Simplfied AnimatedDrawing using Flutter Path objects
//         //Simplfied AnimatedDrawing parsing Path objects from an Svg asset
//         Expanded(
//             child: AnimatedDrawing.svg(
//           'assets/circle.svg',
//           run: run,
//           duration: Duration(seconds: 2),
//           lineAnimation: LineAnimation.oneByOne,
//           animationCurve: Curves.linear,
//           onFinish: () => setState(() {
//             run = false;
//           }),
//           paints: [Paint()..color = Colors.red],
//         )),
//       ])),