import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LogginInBlocState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoggedInBlocState extends LoginState {
  final String token;

  LoggedInBlocState(this.token);

  @override
  // TODO: implement props
  List<Object> get props => [token];
}

class LoggedInErrorBlocState extends LoginState {
  final String message;

  LoggedInErrorBlocState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}