import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples_v1/autodispose/counter_state.dart';


final counterProvider=StateNotifierProvider.autoDispose<CounterState,int>(((ref){


//this will mainatin the state alive 
//ref.keepalive()
//this will mainatin the state alive 
//ref.keepalive()

final link=ref.keepAlive();
final timer =Timer(Duration(seconds: 10), (){
  
  link.close();


});

 ref.onDispose(() => timer.cancel(),);

  return CounterState();
}));


class CounterUi extends ConsumerWidget {
  const CounterUi({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final count=ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('auto dispose example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$count'),
        const SizedBox(height: 50,),
        const Text('The counter value'),
      ],
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: (){
     ref.read(counterProvider.notifier).increment();
      },
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add),
      ),
    );
  }
}