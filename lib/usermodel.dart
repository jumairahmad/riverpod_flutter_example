class UserModel {
  String? createdAt;
  String? name;
  String? avatar;
  String? id;

  UserModel({this.createdAt, this.name, this.avatar, this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['name'] = name;
    data['avatar'] = avatar;
    data['id'] = id;
    return data;
  }
}