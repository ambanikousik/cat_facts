import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'package:cat_facts/domain/cat.dart';

class CatState extends Equatable {
  final bool loading;
  final IList<CatFact> facts;
  final ApiFailure failure;
  const CatState({
    required this.loading,
    required this.facts,
    required this.failure,
  });

  @override
  List<Object> get props => [loading, facts, failure];

  @override
  String toString() =>
      'CatState(loading: $loading, facts: $facts, failure: $failure)';

  CatState copyWith({
    bool? loading,
    IList<CatFact>? facts,
    ApiFailure? failure,
  }) {
    return CatState(
      loading: loading ?? this.loading,
      facts: facts ?? this.facts,
      failure: failure ?? this.failure,
    );
  }
}
