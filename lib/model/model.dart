class ChatModel {
  final String firstname;
  final String message;

  ChatModel({required this.firstname, required this.message});

  factory ChatModel.fromJson(Map data) {
    return ChatModel(firstname: data["firstname"], message: data["message"]);
  }

  Map toJson() {
    return {"firstname": firstname, "message": message};
  }
}
