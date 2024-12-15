import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecylab_final/counter/counter.dart';
import 'package:tecylab_final/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultLocale =
        View.of(context).platformDispatcher.locale.languageCode;
    return BlocProvider(
      create: (context) => CounterCubit(
        defaultLocale == 'es' ? Language.es : Language.en,
      ),
      child: BlocBuilder<CounterCubit, Language>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              ),
              useMaterial3: true,
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: switch (state) {
              Language.en => const Locale('en'),
              Language.es => const Locale('es'),
            },
            home: const CounterPage(),
          );
        },
      ),
    );
  }
}

enum Language { en, es }
