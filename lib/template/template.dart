import 'package:flutter/material.dart';

class TemplateScreen extends StatefulWidget {
  const TemplateScreen({super.key, required this.title});
  final String title;

  @override
  State<TemplateScreen> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _titleWidget = Text(widget.title);
    Widget _textWidget = Text(
      '$_counter',
      style: Theme.of(context).textTheme.headlineMedium,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: _titleWidget,
      ),
      body: const Center(
        child: Text(
          '나는 템플릿 위젯 이에오',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}