class Users {
  String uid = "";
  String account_type = "";
  String birthday = "";
  String email = "";
  String id = "";
  String name = "";
  String nickname = "";
  String notes = "";
  String password = "";
  String phone_number = "";
  String surname = "";

  Users(
      {required this.uid,
      required this.account_type,
      required this.birthday,
      required this.email,
      required this.id,
      required this.name,
      required this.nickname,
      required this.notes,
      required this.password,
      required this.phone_number,
      required this.surname});

  Map<String, dynamic> toMap() {
    return {
      "account_type": account_type,
      "birthday": birthday,
      "email": email,
      "id": id,
      "name": name,
      "nickname": nickname,
      "notes": notes,
      "password": password,
      "phone_number": phone_number,
      "surname": surname
    };
  }
}
