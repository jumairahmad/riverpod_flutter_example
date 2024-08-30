import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples_v1/searching/player_notifier.dart';

class SearchUI extends ConsumerWidget {
  const SearchUI({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    var players=ref.watch(playerNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Filter'),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            
           const SizedBox(height: 20,),
        
           TextField(
            onChanged: (value)=>ref.read(playerNotifierProvider.notifier).filterPlayer(value),
            decoration: InputDecoration(
              hintText: 'Search',
              suffixIcon:Icon( Icons.search),
            ),
           ),
         const SizedBox(height: 20,),

         Expanded(
          
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context,index)=>
        
              ListTile(
              title: Text(
                players[index]['name']

              ),
              subtitle: Text(
                players[index]['country']
              ),
              ),
          
          ) 
          
           ),
        ],),
      ),
    );
  }
}