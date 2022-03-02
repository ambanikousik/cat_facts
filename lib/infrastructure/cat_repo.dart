import 'package:cat_facts/domain/cat.dart';
import 'package:cat_facts/domain/i_cat_repo.dart';
import 'package:clean_api/clean_api.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class CatRepo extends ICatRepo {
  final api = CleanApi.instance();

  @override
  Future<Either<ApiFailure, IList<CatFact>>> getCatFacts() {
    final data = api.get(
        fromJson: (json) {
          final listJson = json as List;
          final factsList =
              List<CatFact>.from(listJson.map((e) => CatFact.fromMap(e)));

          return factsList.lock;
        },
        endPoint: '/facts');

    return data;
  }

  login(String email, String pass) {
    final data = api.post(
        body: {'email': email, 'pass': pass},
        fromJson: (json) {
          final listJson = json as List;
          final factsList =
              List<CatFact>.from(listJson.map((e) => CatFact.fromMap(e)));

          final String token = "abscrafa";

          api.setToken({'Authorization': 'Bearer $token'});

          return factsList.lock;
        },
        endPoint: '/login');
  }
}
