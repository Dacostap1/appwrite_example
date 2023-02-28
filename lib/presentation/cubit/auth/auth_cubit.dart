import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite_example/domain/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  late Session _session;

  Session get session => _session;

  AuthCubit(this._authRepository) : super(AuthCubitInitial());

  void register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _authRepository.register(
          name: name, email: email, password: password);

      final session = await _authRepository.login(
        email: email,
        password: password,
      );
      _session = session;

      emit(AuthCubitLoginSuccess(_session));
    } on AppwriteException catch (e) {
      print(e);
      emit(AuthCubitLoginFailed(e.message ?? 'Error desconocido'));
    }
  }

  void logout() {
    _authRepository.logout(sessionId: _session.$id).then((_) {
      emit(AuthCubitLogoutSuccess());
    }).catchError((e) {
      print(e);
      emit(AuthCubitLogoutFailed());
    });
  }
}
