import '../repositories/authentication_repository.dart';

abstract class ISignOutUsecase {
  Future<void> call();
}

class SignOutUsecase implements ISignOutUsecase {
  SignOutUsecase(IAuthenticationRepository authenticationRepository) {
    _repository = authenticationRepository;
  }

  late final IAuthenticationRepository _repository;

  @override
  Future<void> call() async {
    await _repository.signOut();
  }
}
