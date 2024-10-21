import 'package:blog_demo/counter/counter_bloc.dart';
import 'package:blog_demo/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter/counter_app/counter_page.dart';
import 'login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => CounterBloc()),
        // BlocProvider(create: (context) => SignUpBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: LoginPage(),
        home: CounterPage(),
      ),
    );
  }
}

