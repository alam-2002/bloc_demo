import 'package:equatable/equatable.dart';

class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CounterIncrementEvent extends CounterEvent {
  int incrementCount;
  CounterIncrementEvent({required this.incrementCount});

  @override
  List<Object?> get props => [incrementCount];
}

class CounterDecrementEvent extends CounterEvent {
  int decrementCount;
  CounterDecrementEvent({required this.decrementCount});

  @override
  List<Object?> get props => [decrementCount];
}
