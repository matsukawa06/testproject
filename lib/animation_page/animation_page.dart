import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject/provider.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('アニメーションさせる'),
      ),
      body: const BodyWidget(),
    );
  }
}

// body部
class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                // アニメーション
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  color: Colors.black,
                  height: ref.watch(animationProvider).dblHeight,
                  width: 100,
                ),
              ),
              TextButton(
                onPressed: () {
                  ref.read(animationProvider).onClickedAction();
                },
                child: const Text('アクション'),
              ),
              TextButton(
                onPressed: () {
                  ref.read(animationProvider).onClickedInit();
                },
                child: const Text('初期化'),
              )
            ],
          ),
        );
      },
    );
  }
}
