import 'package:equatable/equatable.dart';
import '../model/login_response_model.dart';

abstract class LoginState extends Equatable{}

// initial state
class LoginInitialState extends LoginState{

  @override
  List<Object?> get props => [];
}


// 1. First State, Loading state after click on login button
class LoginLoadingState extends LoginState{
  @override
  List<Object?> get props => [];
}


// 2. second State, Loaded state after loading state
class LoginLoadedState  extends LoginState{

  LoginResponseModel loginResponseModel;

  LoginLoadedState({required this.loginResponseModel});

  @override
  List<Object?> get props => [loginResponseModel];
}


// 3. Third State, error state after if both 1st & 2nd state fail to appear
class LoginErrorState   extends LoginState{

  String errorMSG;


  LoginErrorState({required this.errorMSG});

  @override
  List<Object?> get props => [errorMSG];
}