import '../models/user_model.dart';
import '../repositories/authentication_repository.dart';

abstract class ILoginWithEmailUsecase {
  Future<String?> call(UserModel userModel);
}

class LoginWithEmailUsecase implements ILoginWithEmailUsecase {
  LoginWithEmailUsecase(IAuthenticationRepository authenticationRepository) {
    _repository = authenticationRepository;
  }

  late final IAuthenticationRepository _repository;

  @override
  Future<String?> call(UserModel userModel) async {
    return _repository.signAccountEmail(userModel);
  }
}
