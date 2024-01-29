part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String errorMessage;
  final StatusEnum status;

  const LoginState({required this.errorMessage, required this.status});

  factory LoginState.initial() {
    return const LoginState(errorMessage: '', status: StatusEnum.initial);
  }

  LoginState copyWith({String? errorMessage, StatusEnum? status}) {
    return LoginState(
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [errorMessage, status];
}
