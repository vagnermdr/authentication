import '../repositories/authentication_repository.dart';

abstract class IGetCurrentUserUsecase {
  Future<String?> call();
}

class GetCurrentUser implements IGetCurrentUserUsecase {
  GetCurrentUser(IAuthenticationRepository authenticationRepository) {
    _repository = authenticationRepository;
  }

  late final IAuthenticationRepository _repository;

  @override
  Future<String?> call() async {
    return _repository.currentUser;
  }
}
