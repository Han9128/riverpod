import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
// import 'package:riverpod/riverpod.dart';

final counterProvider = StateProvider<int>((ref) {
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    print('build');
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[

          Consumer(
            builder:(context, ref, child) {
              final count = ref.watch(counterProvider);
              return Center(child: Text('Count: $count'));
            },),
            

          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
            ElevatedButton(child: Text('+'), onPressed:()=>{
              ref.read(counterProvider.notifier).state++
            }),
            const SizedBox(width: 8,),
            ElevatedButton(child: Text('-'), onPressed:()=>{
              ref.read(counterProvider.notifier).state--
            })
          ],)
        ] 
      ),
    );
  }
}