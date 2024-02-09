import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNameProvider = Provider((ref) => 'Flutter Test');

///
/// テーマ変更用の状態クラス
///
final themeProvider = ChangeNotifierProvider<MyTheme>(
  (ref) => MyTheme(),
);

class MyTheme extends ChangeNotifier {
  // ThemeData current = ThemeData.light();
  Brightness brightness = Brightness.light;
  bool isDark = false;
  var primarySwatch = Colors.blue;
  bool isColor = false;

  Color pickerColor = Colors.blue;

  // とりあえずトグルでテーマを切り替える関数だけ定義する
  brightnessToggle() {
    isDark = !isDark;
    // current = isDark ? ThemeData.dark() : ThemeData.light();
    brightness = isDark ? Brightness.dark : Brightness.light;
    notifyListeners();
  }

  primarySwatchToggle() {
    isColor = !isColor;
    primarySwatch = isColor ? Colors.red : Colors.blue;
    notifyListeners();
  }

  changeColor(Color color) {
    pickerColor = color;
  }
}

///
/// 状態管理表示部分（Model側）を作る
///
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

///
/// アニメーションのProvider
///
final animationProvider = ChangeNotifierProvider<AnimationModel>(
  (ref) => AnimationModel(),
);

class AnimationModel extends ChangeNotifier {
  double dblHeight = 100;

  void onClickedInit() {
    dblHeight = 100;
    notifyListeners();
  }

  void onClickedAction() {
    dblHeight = 0;
    notifyListeners();
  }
}
