class Users {
  String uid = "";
  String title = "";
  String author = "";
  String description = "";
  String level = "";

  Users(
      {required this.uid,
      required this.title,
      required this.author,
      required this.description,
      required this.level});

  Users.fromJson(String uid, Map<String, dynamic> data) {
    uid = uid;
    title = data["title"];
    author = data["author"];
    description = data["description"];
    level = data["level"];
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "level": level,
      "author": author
    };
  }
}
