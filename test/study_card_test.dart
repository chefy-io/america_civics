import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:america_civics/study_card.dart';

void main() {
  test('Card.fromJson()', () {
    var json = jsonDecode("{\"question\":\"hello\",\"answers\":[\"world\"]}");
    final card = StudyCard.fromJson(json);
    expect(card.question, 'hello');
    expect(card.answers, ['world']);
  });

  test('toJson()', () {
    final card = new StudyCard("hello", ["world"]);
    final data = card.toJson();
    expect(data, jsonDecode("{\"question\":\"hello\",\"answers\":[\"world\"]}"));
  });
}