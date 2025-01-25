import 'dart:convert';

class ListUsersModel {
  final String login;
  final String type;
  final String? avatar;


  ListUsersModel({required this.login, required this.type, this.avatar});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'type': type,
      'avatar_url': avatar,
    };
  }

  factory ListUsersModel.fromMap(Map<String, dynamic> map) {
    return ListUsersModel(
      login: map['login'],
      type: map['type'] ,
      avatar: map['avatar_url'] ,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListUsersModel.fromJson(String source) => ListUsersModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
