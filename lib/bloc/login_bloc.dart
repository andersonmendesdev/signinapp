
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../constants/enum_blocs.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<LoginSubmitEvent>(_loginSubmitEvent);
  }

  void _loginSubmitEvent(
      LoginSubmitEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: StatusEnum.loading));
    print('email: ${event.email}');
    print('pass: ${event.password}');

    await Future.delayed(const Duration(milliseconds: 1000));

    emit(state.copyWith(status: StatusEnum.error, errorMessage: 'Deu erro logo ali'));
  }
}
