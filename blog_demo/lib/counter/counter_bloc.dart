import 'package:blog_demo/counter/counter_event.dart';
import 'package:blog_demo/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(CounterInitialState(count: 0)) {

    //on increment event
    on<CounterIncrementEvent>(
      (event, emit) {
        emit(CounterIncrementState(incrementCount: event.incrementCount + 1));
      },
    );

    //on decrement event
    on<CounterDecrementEvent>(
          (event, emit) {
        emit(CounterDecrementState(decrementCount: event.decrementCount - 1));
      },
    );

  }
}
