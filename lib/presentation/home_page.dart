import 'package:cat_facts/application/cat_provider.dart';
import 'package:cat_facts/application/cat_state.dart';
import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(catProvider);

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        ref.read(catProvider.notifier).loadCatFacts();
      });

      return null;
    }, []);

    ref.listen<CatState>(catProvider, (p, c) {
      const noFailure = ApiFailure(type: '', error: '');

      if (p?.failure != c.failure && c.failure != noFailure) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text(c.failure.type),
                  content: Text(c.failure.error),
                ));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat facts'),
      ),
      body: state.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : state.facts.isEmpty
              ? const Center(
                  child: Text('No data available'),
                )
              : ListView.builder(
                  itemCount: state.facts.length,
                  itemBuilder: (_, index) {
                    final fact = state.facts[index];
                    return ListTile(
                      onTap: () {},
                      title: Text(fact.text),
                      subtitle: Text(fact.createdAt.toString()),
                    );
                  }),
    );
  }
}
