import 'package:blog_demo/login/bloc/login_event.dart';
import 'package:blog_demo/login/bloc/login_state.dart';
import 'package:blog_demo/login/repository/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/login_response_model.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginRequestEvent>(
      (event, emit) async {
        emit(LoginLoadingState());

        try {
          LoginResponseModel loginResponseModel = await LoginRepository().login(
            event.loginRequestModel.username,
            event.loginRequestModel.password,
          );
          emit(LoginLoadedState(loginResponseModel: loginResponseModel));
        }
        catch (e) {
          emit(LoginErrorState(errorMSG: e.toString()));
        }
      },
    );
  }
}
