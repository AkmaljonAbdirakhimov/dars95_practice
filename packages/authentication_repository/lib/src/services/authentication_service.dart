import 'package:authentication_repository/src/models/auth.dart';

abstract class AuthenticationService {
  Future<Auth> login(String email, String password);
  Future<Auth> register(String email, String password);
}
