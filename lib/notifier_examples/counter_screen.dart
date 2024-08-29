import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples_v1/notifier_examples/counter_notifier.dart';

class CounterNotifierView extends ConsumerWidget {
  const CounterNotifierView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final counter=ref.watch(counterNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('notifier'),


      ),

      body: Column(
        children: [
          Text(counter.toString()),
          Row(children: [
            ElevatedButton(onPressed: (){
              ref.read(counterNotifierProvider.notifier).increment();
            }, child: Text('+',style: TextStyle(
              fontSize: 40
            ),)),

             ElevatedButton(onPressed: (){

              ref.read(counterNotifierProvider.notifier).decrement();
             }, child: Text('-',style: TextStyle(
              fontSize: 40
            ),)),
          ],)
        ],
      ),
    );
  }
}