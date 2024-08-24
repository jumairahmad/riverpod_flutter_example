import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final streamProvider=StreamProvider<int>(((ref){
  
  return Stream.periodic(const Duration(seconds: 2),((computationCount)=>computationCount));

}));

class StreamProviderExample extends ConsumerWidget {
  const StreamProviderExample({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final streamData=ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Stream Provider'),
      ),
      body: streamData.when(data: (data){

        return Center(child: Text(data.toString(),style: TextStyle(fontSize: 20),));
      }, error: ((error,stackTrace)=>Text(error.toString())), loading: ()=>const Center(child: CircularProgressIndicator(),)),
    );
  }
}