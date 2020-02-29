import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';
import '../../logics/login_logic.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginLogic logic;
  LoginBloc({@required this.logic});

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is DoLoginEvent) {
      yield LogginInBlocState();

      try {
        var token = await logic.login(event.email, event.password);
        yield LoggedInBlocState(token);
      } on LoginException {
          yield LoggedInErrorBlocState('No se pudo loguear');
      }

    }
  }
}
