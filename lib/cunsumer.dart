import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples_v1/main.dart';
//this only updates the text widget not whole screen 
class ConsumerExample extends StatelessWidget {
  const ConsumerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: Consumer(builder: (context, ref, child) {
          final name = ref.watch(nameprovider);
          return Text(name);
        },),
      ),
    );
  }
}