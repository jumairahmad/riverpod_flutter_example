import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples_v1/counter_notifier.dart';


final counterProvider= StateNotifierProvider<CounterNotifier,int>((ref)=>CounterNotifier());


class CounterUi extends ConsumerWidget {
  const CounterUi({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final cont=ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter example'),
      ),

     body: Column(
      children: [
        Center(
          child: Text('$cont'),
        )
      ],
     ),
     floatingActionButton: FloatingActionButton(
      child:const Icon(Icons.add),
      
      onPressed: (){

    ref.read(counterProvider.notifier).increment();

      },
      ),

    );
  }
}