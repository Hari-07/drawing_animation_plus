import 'package:example/widgets/multi_path_one_by_one.dart';
import 'package:example/widgets/simple_single_path.dart';
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
  int activeIndex = 1;

  late List<SVGWidget> examples = [
    SVGWidget(
      label: 'Simple Single Path SVG',
      child: SimpleSinglePath(
        run: run,
        onFinish: () {
          setState(() {
            run = false;
          });
        },
      ),
    ),
    SVGWidget(
      label: 'Multiple Path SVG: One by One',
      child: MultiPathOneByOne(
        run: run,
        onFinish: () {
          setState(() {
            run = false;
          });
        },
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  void setIndex(int index) {
    setState(() {
      activeIndex = index;
      run = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(examples[activeIndex].label)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          run = !run;
        }),
        child: Icon((run) ? Icons.stop : Icons.play_arrow),
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(examples[index].label),
              onTap: () => setIndex(index),
            );
          },
          itemCount: examples.length,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [Expanded(child: examples[activeIndex].child)],
          ),
        ),
      ),
    );
  }
}

class SVGWidget {
  SVGWidget({required this.child, required this.label});

  final Widget child;
  final String label;
}
