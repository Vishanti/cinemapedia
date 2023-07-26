import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularView extends ConsumerStatefulWidget {
  const PopularView({super.key});

  @override
  PopularViewState createState() => PopularViewState();
}

class PopularViewState extends ConsumerState<PopularView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  static const messages = <String>[
    'Cargando Peliculas Populares',
  ];

  void loadNextPage() async {
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final popularMovies = ref.watch(popularMoviesProvider);
    if (popularMovies.isEmpty) {
      return const FullScreenLoader(messages: messages);
    }

    return Scaffold(
        body: MovieMasonry(
      movie: popularMovies,
      loadNextPage: loadNextPage,
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
