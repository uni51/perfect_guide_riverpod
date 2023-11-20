import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:perfect_riverpod/s1.dart';


class MyWidget1 extends ConsumerWidget {
  const MyWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ⭐️ buildの中で状態をwatchする
    final s1 = ref.watch(s1NotifierProvider);
    // S1 listen
    ref.listen(
      s1NotifierProvider,
          (oldState, newState) {
        // スナックバーを表示
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$oldState から $newState へ変更されました'),
          ),
        );
      },
    );
    // S1 テキスト
    final s1Text = Text('$s1');
    // S1 ボタン
    final s1Button = ElevatedButton(
      onPressed: () {
        // ⭐️ 画面を触ったら Notifier をread
        final notifier = ref.read(s1NotifierProvider.notifier);
        // S1 データを変更
        notifier.updateState();
      },
      child: const Text('+1'),
    );

    // 縦に並べる
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        s1Text,
        s1Button,
      ],
    );
  }
}

