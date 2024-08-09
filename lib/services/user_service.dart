import 'package:dio/dio.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:user_repository/user_repository.dart';

class FirebaseUserService extends UserService {
  final _dio = Dio(
    BaseOptions(baseUrl: "https://dars66-ae91b-default-rtdb.firebaseio.com"),
  );

  @override
  Future<Auth> addUser(String id, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.patch(
        "/users/$id.json",
        data: data,
      );

      return Auth.fromMap(response.data);
    } on DioException catch (e) {
      throw (e.response?.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> getUser(String id) async {
    try {
      final response = await _dio.get("/users/$id.json");
      final userMap = response.data;
      userMap['id'] = id;
      return User.fromMap(userMap);
    } on DioException catch (e) {
      throw (e.response?.data);
    } catch (e) {
      rethrow;
    }
  }
}
