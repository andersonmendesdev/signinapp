import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<LoginSubmitEvent>(_loginSubmitEvent);
  }

  void _loginSubmitEvent(
      LoginSubmitEvent event, Emitter<LoginState> emit) async {
    print('email: ${event.email}');
    print('pass: ${event.password}');
  }
}
