part of 'login_bloc.dart';

 class LoginState extends Equatable {
   final String errorMessage;
  const LoginState({required this.errorMessage});

  factory LoginState.initial(){
    return LoginState(errorMessage: '');
  }

  LoginState copyWith({String? errorMessage}){
    return LoginState(errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object> get props => [errorMessage];
}


