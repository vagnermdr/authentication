import '../models/user_model.dart';

abstract class IAuthenticationRepository {
  Future<String?> createUserEmail(UserModel userModel);

  Future<String?> signAccountEmail(UserModel userModel);

  Future<void> signOut();

  Future<String?> get currentUser;
}
