

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'player_notifier.g.dart';
@riverpod
class PlayerNotifier extends _$PlayerNotifier{

final List<Map<String,dynamic>> allPlayers=[
  {"name":"rohit" ,"country":"india" },
  {"name":"Liam", "country":"USA"},
{"name":"Sophia", "country":"Canada"},
{"name":"Carlos", "country":"Mexico"},
{"name":"Mei", "country":"China"},
{"name":"Amina", "country":"Egypt"},
{"name":"Yuki", "country":"Japan"},
{"name":"Emilia", "country":"Brazil"},
{"name":"Sven", "country":"Sweden"},
{"name":"Fatima", "country":"Morocco"},
{"name":"Kofi", "country":"Ghana"},
{"name":"Emilia", "country":"Brazil"},
{"name":"Sven", "country":"Sweden"},
{"name":"Fatima", "country":"Morocco"},
{"name":"Kofi", "country":"Ghana"},
];


@override
  List<Map<String,dynamic>> build(){
  return allPlayers;
 }

 void filterPlayer(String name){
  
  List<Map<String,dynamic>> results=[];

  if(name.isEmpty){
    results=allPlayers;
  }else {


    results=allPlayers.where((element)=>element['name']
    .toString()
    .toLowerCase()
    .contains(name.toLowerCase())
    
    ).toList();
  }

state=results;

 }


}