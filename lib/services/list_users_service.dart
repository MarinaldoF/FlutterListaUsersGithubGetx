import 'package:dio/dio.dart';
import 'package:list_users_github/models/list_users_model.dart';

class ListUsersService {
  final Dio dio;

  ListUsersService({required this.dio});

  Future listUsers() async {
    final result = await dio.get('https://api.github.com/users');

    List<ListUsersModel> users = [];

    result.data.map((item) {
      users.add(ListUsersModel.fromMap(item));
    }).toList();

    return users;
  }
}
