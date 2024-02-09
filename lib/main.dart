import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject/animation_page/animation_page.dart';
import 'package:testproject/color_change_page/color_change.dart';
import 'package:testproject/move_widget_page/move_widget.dart';

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
            _pageRoute(context, 'カラー、ダークモードの変更', 1),
            _pageRoute(context, 'Widgetを自由に動かす', 2),
            _pageRoute(context, 'Widgetをアニメーション', 3),
          ],
        ),
      ),
    );
  }

  Widget _pageRoute(BuildContext context, String titleText, int no) {
    return Card(
      child: ListTile(
        title: Text(titleText),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                switch (no) {
                  case 1:
                    // カラーの変更ページ
                    return const ColorChangePage();
                  case 2:
                    return const MoveWidgetPage();
                  case 3:
                    return const AnimationPage();
                  default:
                    return Container();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
