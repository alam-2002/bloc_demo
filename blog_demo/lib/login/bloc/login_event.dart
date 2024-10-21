import 'package:equatable/equatable.dart';
import '../model/login_request_model.dart';

abstract class LoginEvent extends Equatable{}


class LoginRequestEvent extends LoginEvent{

  LoginRequestModel loginRequestModel;

  LoginRequestEvent({required this.loginRequestModel});

  @override
  List<Object?> get props => [loginRequestModel];

}