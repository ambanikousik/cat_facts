import 'dart:convert';

import 'package:equatable/equatable.dart';

class CatFact extends Equatable {
  final String text;
  final String type;
  final DateTime createdAt;
  const CatFact({
    required this.text,
    required this.type,
    required this.createdAt,
  });

  CatFact copyWith({
    String? text,
    String? type,
    DateTime? createdAt,
  }) {
    return CatFact(
      text: text ?? this.text,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'type': type,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory CatFact.fromMap(Map<String, dynamic> map) {
    return CatFact(
      text: map['text'] ?? '',
      type: map['type'] ?? '',
      createdAt: DateTime.fromMicrosecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CatFact.fromJson(String source) =>
      CatFact.fromMap(json.decode(source));

  @override
  String toString() =>
      'CatFact(text: $text, type: $type, createdAt: $createdAt)';

  @override
  List<Object> get props => [text, type, createdAt];
}
