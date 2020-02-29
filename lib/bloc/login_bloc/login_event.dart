import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class DoLoginEvent extends LoginEvent {
  final String email;
  final String password;

  DoLoginEvent(this.email, this.password);
  @override
  // TODO: implement props
  List<Object> get props => [email, password];
}
