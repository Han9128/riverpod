
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloProvider = Provider<String>((ref){
  return "Hello, Provider";
}); 


class HomeScreen extends ConsumerStatefulWidget{
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends ConsumerState<HomeScreen>{
  @override
  Widget build(BuildContext context){
    final hello = ref.watch(helloProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:Text(hello, style:TextStyle(fontSize:50),),
      )
    );
  }
}


// class HomeScreen extends ConsumerWidget{
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref){

//     final hello = ref.watch(helloProvider);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child:Text(hello, style:TextStyle(fontSize:50),),
//       )
//     );
//   }

// }