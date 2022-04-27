import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthenticationDatasource {
  Future<User?> createUserEmail(Map<String, dynamic> mapData);

  Future<User?> signAccountEmail(Map<String, dynamic> mapData);

  Future<void> signOut();

  Future<String?> get getCurrentUser;
}
