import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_03/slider_provider.dart';


class HomeScreen extends ConsumerWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext cotnext, WidgetRef ref){
    
    return Scaffold(
      appBar: AppBar(title:Text('Multi State Hanlidng')),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
         Consumer(builder: (context, ref, child){
          // subscribing to the whole appstate makes re render other consumer widget as well even if their state is not changing
          // final appState = ref.watch(appProvider);
          // we can avoid this and re render only the consumer widget whose state is chaning by using select method from riverpod
          final slider = ref.watch(appProvider.select((state)=>state.slider));
           return Container(
            width:200,
            height:200,
            color:Colors.amber.withValues(alpha:slider),
          );
         },),
         Consumer(builder: (context, ref, child){
           final slider = ref.watch(appProvider.select((state)=>state.slider));
           return Slider(value:slider,onChanged: (value){
           ref.read(appProvider.notifier).state = ref.read(appProvider.notifier).state.copyWith(slider:value);
          });
         },),
          
         Consumer(builder: (context, ref, child){
           final showPassword = ref.watch(appProvider.select((state)=>state.showPassword));
           return InkWell(
            onTap:() {
              ref.read(appProvider.notifier).state = ref.read(appProvider.notifier).state.copyWith(showPassword:!showPassword);
            },
             child: Container(
              width:20,
              height:20,
              child:showPassword?Icon(Icons.remove_red_eye):Icon(Icons.password),
                       ),
           );
         },),
        ],
      )
    );
  }
}