import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNameProvider = Provider((ref) => 'Flutter Test');

// テーマ変更用の状態クラス
final themeProvider = ChangeNotifierProvider<MyTheme>(
  (ref) => MyTheme(),
);

class MyTheme extends ChangeNotifier {
  ThemeData current = ThemeData.light();
  bool isDark = false;

  // とりあえずトグルでテーマを切り替える関数だけ定義する
  toggle() {
    isDark = !isDark;
    current = isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}

// 状態管理表示部分（Model側）を作る
final counterProvider = ChangeNotifierProvider<CountModel>(
  (ref) => CountModel(),
);

class CountModel extends ChangeNotifier {
  int state = 0;

  void incrementCounter() {
    state++;
    notifyListeners();
  }
}
