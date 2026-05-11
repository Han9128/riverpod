import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_05/item_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('TO DO APP')),
      body: item.isEmpty? Center(child: const Text('No Data Found')): ListView.builder(itemCount:item.length, itemBuilder: (context, index){
        final itemDetail = item[index];
        return ListTile(
          title: Text(itemDetail.item),
          trailing:Row( 
            mainAxisSize:MainAxisSize.min,
            children:[
              IconButton(icon: const Icon(Icons.edit), onPressed:(){
                ref.read(itemProvider.notifier).updateItem(itemDetail.id,'Updated Item');
              }),
              IconButton(icon: const Icon(Icons.delete), onPressed:(){
                ref.read(itemProvider.notifier).deleteItem(itemDetail.id);
              })
            ]
          )
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(itemProvider.notifier).addItem('New Item');
        },
        child:const Icon(Icons.add),
      )
    );
  }
}
