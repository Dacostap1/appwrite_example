import 'package:appwrite/models.dart' as model;

abstract class AuthRepository {
  Future<model.Session> login({
    required String email,
    required String password,
  });
  Future<model.Account> register({
    required String name,
    required String email,
    required String password,
  });
  Future<void> logout({required String sessionId});
}
