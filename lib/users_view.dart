import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examples_v1/apiservices.dart';
import 'package:riverpod_examples_v1/usermodel.dart';



//lets create provideers 

final apiProvider=Provider<ApiService>((ref)=>ApiService());

final userListProvider=FutureProvider<List<UserModel>>(
 (ref){
  return ref.read(apiProvider).getUsers();
 }
);


class UsersView extends ConsumerWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userData=ref.watch(userListProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),

      body: userData.when(data: (data){

      return ListView.builder(
        itemCount: data.length,
        itemBuilder: ((context,index){
    
     return ListTile(
      title: Text("${data[index].name}"),
      subtitle: Text("${data[index].name}"),
      leading: CircleAvatar(
        child: Image.network(data[index].avatar!),
      ),
     );


      }));

      }, error:((error,stackTrace){

      return Column(children: [
        Center(child: Text(error.toString())),
        Text('error here ')
        
      
      ]);
      }), loading:((){
      
      return const Center(
        child: CircularProgressIndicator(),
      );
      })
      ),
    );
  }
}