part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthCubitInitial extends AuthState {}

class AuthCubitRegisterSuccess extends AuthState {}

class AuthCubitRegisterFailed extends AuthState {
  final String message;

  AuthCubitRegisterFailed(this.message);
}

class AuthCubitLoginSuccess extends AuthState {
  final Session session;

  AuthCubitLoginSuccess(this.session);
}

class AuthCubitLoginFailed extends AuthState {
  final String message;

  AuthCubitLoginFailed(this.message);
}

class AuthCubitLogoutSuccess extends AuthState {}

class AuthCubitLogoutFailed extends AuthState {}
