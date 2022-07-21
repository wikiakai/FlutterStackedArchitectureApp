class UserModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

// constructor
  UserModel({this.id, this.firstName, this.lastName, this.email, this.avatar});
// convert json to model
  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      email: data['email'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      avatar: data['avatar'],
    );
  }
}
