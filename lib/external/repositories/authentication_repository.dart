import '../../domain/models/user_model.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../datasources/authentication_datasource_interface.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  AuthenticationRepository(IAuthenticationDatasource datasource) {
    _datasource = datasource;
  }

  late final IAuthenticationDatasource _datasource;

  @override
  Future<String?> createUserEmail(UserModel userModel) async {
    final response = await _datasource.createUserEmail(userModel.toMap());

    if (response == null) {
      return null;
    }
    return response.uid;
  }

  @override
  Future<String?> signAccountEmail(UserModel userModel) async {
    final response = await _datasource.signAccountEmail(userModel.toMap());

    if (response == null) {
      return null;
    }
    return response.uid;
  }

  @override
  Future<void> signOut() async {
    await _datasource.signOut();
  }

  @override
  Future<String?> get currentUser async => _datasource.getCurrentUser;
}
