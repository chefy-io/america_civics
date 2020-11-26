class StudyCard {
  String question;
  List<String> answers;

  StudyCard({this.question, this.answers});

  StudyCard.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answers = json['answers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answers'] = this.answers;
    return data;
  }
}