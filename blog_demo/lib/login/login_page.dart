import 'package:blog_demo/login/bloc/login_bloc.dart';
import 'package:blog_demo/login/bloc/login_event.dart';
import 'package:blog_demo/login/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model/login_request_model.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Get.back();
        //   },
        //   icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        // ),
        title: Text('Login'),
        centerTitle: true,
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (BuildContext context, state) {
          if(state is LoginInitialState) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(hintText: 'username'),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(hintText: 'password'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        var bloc = BlocProvider.of<LoginBloc>(context);
                        var request = LoginRequestModel(username: usernameController.text, password: passwordController.text);

                        bloc.add(LoginRequestEvent(
                            loginRequestModel: request));
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            );
          }
          else if(state is LoginLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          else if(state is LoginLoadedState) {
            return Center(child:  Text(state.loginResponseModel.email));
          }
          else if(state is LoginErrorState) {
            return Center(child: Text(state.errorMSG));
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}
