import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:appwrite_example/constants/appwrite_constants.dart';
import 'package:appwrite_example/domain/repository/auth_repository.dart';

class AuthRepositoryImple implements AuthRepository {
  final client = Client();
  late Account account;

  AuthRepositoryImple() {
    client
        .setEndpoint(AppWriteConstants.endPoint)
        .setProject(AppWriteConstants.projectId);

    account = Account(client);
  }

  @override
  Future<model.Session> login({
    required String email,
    required String password,
  }) async {
    return await account.createEmailSession(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout({required String sessionId}) async {
    await account.deleteSession(sessionId: sessionId);
  }

  @override
  Future<model.Account> register({
    required String name,
    required String email,
    required String password,
  }) async {
    return await account.create(
      userId: ID.unique(),
      email: email,
      password: password,
      name: 'My Name',
    );
  }
}
