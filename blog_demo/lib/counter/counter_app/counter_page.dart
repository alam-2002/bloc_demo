import 'package:blog_demo/counter/counter_bloc.dart';
import 'package:blog_demo/counter/counter_event.dart';
import 'package:blog_demo/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App using Bloc'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<CounterBloc, CounterState>(
                builder: (context, state) {
                  if (state is CounterInitialState) {
                    return Text(state.count.toString(), style: textStyle());
                  } else if (state is CounterIncrementState) {
                    return Text(state.incrementCount.toString(),
                        style: textStyle());
                  } else if (state is CounterDecrementState) {
                    return Text(state.decrementCount.toString(),
                        style: textStyle());
                  } else {
                    return Container();
                  }
                },
                listener: (context, state) {
                  if (state is CounterIncrementState) {
                    var snackBar =
                        SnackBar(content: Text('Value Increment Successful'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else if (state is CounterDecrementState) {
                    var snackBar =
                        SnackBar(content: Text('Value Decrement Successful'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context).add(
                            CounterIncrementEvent(incrementCount: counter++));
                      },
                      child: Text('+', style: textStyle()),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context).add(
                            CounterDecrementEvent(decrementCount: counter--));
                      },
                      child: Text('-', style: textStyle()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

textStyle() {
  return TextStyle(color: Colors.black, fontSize: 32);
}
