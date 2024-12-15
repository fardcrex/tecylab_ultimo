import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecylab_final/counter/counter.dart';
import 'package:tecylab_final/l10n/l10n.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CounterView();
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CounterText(),
          const SizedBox(height: 8),
          Text(l10n.helloWorld),
          Text(l10n.welcomeMessage('Flutter')),
          Text(l10n.remainingItems(0)),
          Text(l10n.remainingItems(1)),
          Text(l10n.remainingItems(5)),
          Text(l10n.greeting('male')),
          Text(l10n.greeting('female')),
          Text(l10n.escapedMessage),
          Text(l10n.formattedDate(DateTime.now())),
          Text(l10n.formattedNumber(1200, 2)),
          Text(l10n.formattedNumber(1200, 2)),
          Text(l10n.formattedNumber(324, 234234)),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().changeToSpanish(),
            child: const Text('ES'),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().changeToEnglish(),
            child: const Text('EN'),
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text(
      '$count ${l10n.localeName}',
      style: theme.textTheme.displayLarge,
    );
  }
}
