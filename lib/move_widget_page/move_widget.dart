import 'package:flutter/material.dart';

class MoveWidgetPage extends StatelessWidget {
  const MoveWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Widgetを自由に動かす'),
      ),
      body: const BodyWidget(),
    );
  }
}

// /// AppBar部
// class _AppBar extends StatelessWidget {
//   const _AppBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       builder: (context, snapshot) {
//         return AppBar(
//           elevation: 0.0, // 境界線を消す
//           title: const Text('Widgetを自由に動かす'),
//         );
//       },
//       future: null,
//     );
//   }
// }

/// body部
class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: const Text('ここからドラッグ'),
            color: Colors.red,
            alignment: Alignment.center,
            width: 300,
            height: 50,
          ),
          const SizedBox(height: 100),
          Container(
            child: const Text('ここにドロップ'),
            color: Colors.grey.withOpacity(0.5),
            alignment: Alignment.center,
            width: 300,
            height: 50,
          ),
        ],
      ),
    );
  }
}
