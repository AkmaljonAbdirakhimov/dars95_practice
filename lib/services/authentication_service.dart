import 'package:dio/dio.dart';

import 'package:authentication_repository/authentication_repository.dart';

class FirebaseAuthenticationService extends AuthenticationService {
  final _apiKey = "AIzaSyAc5BvJzSKz9XpJXl1I-8YCpzg0p9VGcYA";
  final _dio = Dio(
    BaseOptions(baseUrl: "https://identitytoolkit.googleapis.com/v1/accounts:"),
  );

  @override
  Future<Auth> login(String email, String password) async {
    try {
      final response = await _dio.post(
        "signInWithPassword?key=$_apiKey",
        data: {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      );

      return Auth.fromMap(response.data);
    } on DioException catch (e) {
      throw (e.response?.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Auth> register(String email, String password) async {
    try {
      final response = await _dio.post(
        "signUp?key=$_apiKey",
        data: {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      );

      return Auth.fromMap(response.data);
    } on DioException catch (e) {
      throw (e.response?.data);
    } catch (e) {
      rethrow;
    }
  }
}
