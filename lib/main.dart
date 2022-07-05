import 'package:flutter/material.dart';

void main() => runApp(const ContainerApp());

class ContainerApp extends StatelessWidget {
  const ContainerApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const HomeWidget(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.amber,
            border: Border.all(width: 2.0),
          ),
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(_animation!.value),
            child: const Icon(Icons.airplanemode_active, size: 150.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _spin,
        tooltip: 'Increment',
        child: const Icon(Icons.rotate_right),
      ),
    );
  }

  void _spin() {
    _controller!.forward(from: 0.0);
  }
}
