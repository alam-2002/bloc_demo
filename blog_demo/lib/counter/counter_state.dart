import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CounterInitialState extends CounterState {
  int count;
  CounterInitialState({required this.count});

  @override
  List<Object?> get props => [count];
}

class CounterIncrementState extends CounterState {
  int incrementCount;
  CounterIncrementState({required this.incrementCount});

  @override
  List<Object?> get props => [incrementCount];
}

class CounterDecrementState extends CounterState {
  int decrementCount;
  CounterDecrementState({required this.decrementCount});

  @override
  List<Object?> get props => [decrementCount];
}