import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MyCounter extends Cubit<int> {
  MyCounter({this.startNum = 0}) : super(startNum); // default starting value

  int startNum;

  int? current;
  int? next;

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    debugPrint("$change");
    current = change.currentState;
    next = change.nextState;
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    debugPrint("$error");
  }
}
