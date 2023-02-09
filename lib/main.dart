import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject/color_change.dart';

import 'provider.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final myTheme = ref.watch(themeProvider);
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: myTheme.primarySwatch,
          brightness: myTheme.brightness,
        ),
        home: _MyHomePage(),
      );
    });
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(builder: (context, ref, _) {
          final appName = ref.watch(appNameProvider);
          return Text(appName);
        }),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                title: const Text('カラー、ダークモードの変更'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const ColorChangePage();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageRoute(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('カラー、ダークモードの変更'),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const ColorChangePage();
            }),
          );
        },
      ),
    );
  }
}
