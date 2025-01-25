import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_users_github/controller/home_controller.dart';
import 'package:list_users_github/services/list_users_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late final HomeController _controller;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _controller = HomeController(service: ListUsersService(dio: Dio()));
    _controller.getListUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Lista de Usuários do GitHub')),
      ),
      body: Obx(
        () {
          return _controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : _controller.users.isEmpty
                  ? const Center(child: Text('Nenhum usuário encontrado'))
                  : ListView.builder(
                      itemCount: _controller.users.length,
                      itemBuilder: (context, index) {
                        final user = _controller.users[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              user.avatar!,
                            ),
                          ),
                          title: Text(user.login),
                        );
                      },
                    );
        },
      ),
    );
  }
}

