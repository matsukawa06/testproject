// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNameProvider = Provider((ref) => 'Flutter Test');
final counterProvider = StateProvider((ref) => 0);

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final _counter = ref.watch(counterProvider);
    return Scaffold(
        appBar: AppBar(
          title: Consumer(builder: (context, ref, _) {
            final appName = ref.watch(appNameProvider);
            return Text(appName);
          }),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer(builder: (context, ref, _) {
                final _counter = ref.watch(counterProvider.state);
                return Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                );
              }),
            ],
          ),
        ),
        floatingActionButton: Consumer(builder: (context, ref, _) {
          return FloatingActionButton(
            onPressed: () {
              ref.watch(counterProvider.state).state++;
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        })
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
