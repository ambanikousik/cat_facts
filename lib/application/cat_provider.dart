import 'package:cat_facts/application/cat_state.dart';
import 'package:cat_facts/domain/i_cat_repo.dart';
import 'package:cat_facts/infrastructure/cat_repo.dart';
import 'package:clean_api/clean_api.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final catProvider = StateNotifierProvider<CatNotifier, CatState>((ref) {
  return CatNotifier(CatRepo());
});

class CatNotifier extends StateNotifier<CatState> {
  final ICatRepo catRepo;
  CatNotifier(this.catRepo)
      : super(const CatState(
            loading: false,
            facts: IListConst([]),
            failure: ApiFailure(type: '', error: '')));

  loadCatFacts() async {
    state = state.copyWith(loading: true);

    final data = await catRepo.getCatFacts();

    state = data
        .fold(
            (l) => state.copyWith(failure: l), (r) => state.copyWith(facts: r))
        .copyWith(loading: false);
  }
}
