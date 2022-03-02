import 'package:cat_facts/domain/cat.dart';
import 'package:clean_api/clean_api.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

abstract class ICatRepo {
  Future<Either<ApiFailure, IList<CatFact>>> getCatFacts();

  login(String email, String pass);
}
