import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject/provider.dart';

class ColorChangePage extends StatelessWidget {
  const ColorChangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: const BodyWidget(),
      floatingActionButton: Consumer(builder: (context, ref, _) {
        final countModel = ref.watch(counterProvider);
        return FloatingActionButton(
          onPressed: () {
            countModel.incrementCounter();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Consumer(builder: (context, ref, _) {
            final _counter = ref.watch(counterProvider).state;
            return Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            );
          }),
          Consumer(builder: (context, ref, _) {
            final myTheme = ref.watch(themeProvider);
            return Column(
              children: [
                SwitchListTile(
                  value: myTheme.isDark,
                  title: const Text('ダークモード'),
                  onChanged: (bool value) {
                    myTheme.brightnessToggle();
                  },
                ),
                SwitchListTile(
                  value: myTheme.isColor,
                  title: const Text('カラー変更'),
                  onChanged: (bool value) {
                    myTheme.primarySwatchToggle();
                  },
                ),
                // MaterialPickerをここに追加予定
                // showDialog(context: context, child: AlertDialog()),
                TextButton(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('カラー選択'),
                          content: MaterialPicker(
                            pickerColor: myTheme.pickerColor,
                            onColorChanged: myTheme.changeColor,
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('決定'),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('カラー変更'),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
