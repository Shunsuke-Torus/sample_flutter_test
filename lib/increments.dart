import 'package:flutter/material.dart';
import './comments.dart';

class Increments extends StatefulWidget {
  static const routeName = "/increments";
  const Increments({super.key});

  @override
  State<Increments> createState() => _IncrementsState();
}

class _IncrementsState extends State<Increments> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Demo Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
              onPressed: () {
                _incrementCounter();
              },
              key: const Key('top_page_msg'),
              child: Text(
                "$_counter",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Comments.routeName);
              },
              key: const Key("top_page_comments_button"),
              child: const Text("Comments"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
