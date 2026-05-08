import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'search_provider.dart';


class HomeScreen extends ConsumerWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return Scaffold(
      appBar:AppBar(title:Text('StateNotifier Provider')),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          TextField(
            onChanged:(value){
              ref.read(searchProvider.notifier).search(value);
            }
          ),

          Consumer(builder: (context, ref, child) {
            final search = ref.watch(searchProvider);
            return Text(search.search);
          },),

          Consumer(builder: (context, ref, child) {
            final search = ref.watch(searchProvider);
            return Switch(value:search.isChange, onChanged:(value){
              ref.read(searchProvider.notifier).onChange(value);
            },);
          },)
        ]
            )
    );
  }
}