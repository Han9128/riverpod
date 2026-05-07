import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final appProvider = StateProvider<AppState>((ref){
  return AppState(slider: 0.1,showPassword:false);
});


class AppState{
  final double slider;
  final bool showPassword;
  AppState({required this.slider, required this.showPassword});

  AppState copyWith({double? slider, bool? showPassword}){
    return AppState(slider:slider?? this.slider, showPassword:showPassword?? this.showPassword);
  }
}




