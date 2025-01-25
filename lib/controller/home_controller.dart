import 'package:get/get.dart';
import 'package:list_users_github/models/list_users_model.dart';
import 'package:list_users_github/services/list_users_service.dart';


class HomeController extends GetxController {
  final ListUsersService service;

  HomeController({required this.service});

  final List<ListUsersModel> _users = <ListUsersModel>[].obs;
  List<ListUsersModel> get users => _users;



  final _isLoading = false.obs;
  RxBool get isLoading => _isLoading;



  getListUsers () async {
    _isLoading.value = true;
    final result = await service.listUsers();
    _users.assignAll(result);
    _isLoading.value = false;

    
  }
}
