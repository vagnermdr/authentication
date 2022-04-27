import 'package:firebase_auth/firebase_auth.dart';

import 'authentication_datasource_interface.dart';

class AuthenticationFirebaseDatasource implements IAuthenticationDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _currentUser;

  @override
  Future<User?> createUserEmail(Map<String, dynamic> mapData) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(
          email: mapData['email'] as String,
          password: mapData['password'] as String,
        )
        .then((value) => _currentUser = value.user)
        .catchError(
      (onError) {
        Future.error(_returnErrorFirebaseAuth(onError).toString());
        return null;
      },
    );

    return _currentUser;
  }

  @override
  Future<User?> signAccountEmail(Map<String, dynamic> mapData) async {
    await _firebaseAuth
        .signInWithEmailAndPassword(
      email: mapData['email'] as String,
      password: mapData['password'] as String,
    )
        .then((auth) {
      _currentUser = auth.user;
    }).catchError((onError) {
      Future.error(_returnErrorFirebaseAuth(onError).toString());
    });

    return _currentUser;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  String _returnErrorFirebaseAuth(error) {
    String message;

    switch (error.code) {
      case "email-already-in-use":
        message = "Este endereço de email ja está cadastrado.";
        break;
      case "weak-password":
        message = "A senha deve ter pelo menos 6 caracteres.";
        break;
      case "invalid-email":
        message = "Insira um email válido.";
        break;
      case "user-not-found":
        message = "Nã existe usuário com estas credenciais.";
        break;
      case "ERROR_USER_DISABLED":
        message = "User with this email has been disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        message = "Too many requests. Try again later.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        message = "Signing in with Email and Password is not enabled.";
        break;
      default:
        message = "Verifique os dados informados.";
    }

    return message;
  }

  @override
  Future<String?> get getCurrentUser async {
    if (_firebaseAuth.currentUser == null) {
      return null;
    }

    return _firebaseAuth.currentUser?.uid;
  }
}
