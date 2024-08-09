import 'dart:async';

import 'package:user_repository/src/models/models.dart';
import 'package:user_repository/src/services/user_service.dart';

class UserRepository {
  User? _user;
  final UserService _userService;

  UserRepository({
    required UserService userService,
  }) : _userService = userService;

  Future<User?> getUser(String id) async {
    if (_user != null) return _user;
    _user = await _userService.getUser(id);
    return _user;
  }

  Future<void> addUser(String id, {Map<String, dynamic>? data}) async {
    await _userService.addUser(id, data: data);
  }
}
