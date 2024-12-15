import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecylab_final/counter/counter.dart';
import 'package:tecylab_final/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //  final defaultLocale =
    View.of(context).platformDispatcher.locale.languageCode;
    return BlocProvider(
      create: (context) => CounterCubit(
        Language.es,
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
            locale: const Locale('en'),
            home: const CounterPage(),
          );
        },
      ),
    );
  }
}

enum Language { en, es }
