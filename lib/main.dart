import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples_v1/autodispose/counter_ui.dart';
import 'package:riverpod_examples_v1/counter_ui.dart';
import 'package:riverpod_examples_v1/cunsumer.dart';
import 'package:riverpod_examples_v1/streamproviderexample.dart';
import 'package:riverpod_examples_v1/users_view.dart';


final nameprovider= Provider<String>(
  (ref){

    return "hello Jumair";
  },
);

final isLightTheme= StateProvider<bool>((ref){
  return true;
});
void main() {
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final islight=ref.watch(isLightTheme);
    return MaterialApp(
      title: 'theme',
      theme: islight?ThemeData.light():ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name=ref.watch(nameprovider);
    final themeProvider=ref.watch(isLightTheme);
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Example'),
        leading: Switch(value: themeProvider,
         onChanged: (value)=>ref.read(isLightTheme.notifier).state=value),
      ),
      body: Container(

      child: Column(

        children: [
          Text('Hello providers '),
          Center(child: Text(name),),
          ConsumerExample(),
    

        TextButton.icon(onPressed: (){

          Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> CounterU()),
          );
        }, label:const Text('Counter example State notifier')),

    TextButton.icon(onPressed: (){

          Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> UsersView()),
          );
        }, label:const Text('Future Provider')),

          TextButton.icon(onPressed: (){

          Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> StreamProviderExample()),
          );
        }, label:const Text('Stream Provider')),


 TextButton.icon(onPressed: (){

          Navigator.push(context, 
          MaterialPageRoute(builder: (context)=>CounterUi()),
          );
        }, label:const Text('Auto dispose modifiers and time based caching'))
        ],
      ),
    ),
    );
  }
}