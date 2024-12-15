import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tecylab_final/app/view/app.dart';
import 'package:tecylab_final/counter/counter.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(CounterCubit(Language.es).state, equals(Language.es));
    });

    blocTest<CounterCubit, Language>(
      'emits [1] when increment is called',
      build: () => CounterCubit(Language.es),
      act: (cubit) => cubit.changeToEnglish(),
      expect: () => [equals(Language.en)],
    );

    blocTest<CounterCubit, Language>(
      'emits [-1] when decrement is called',
      build: () => CounterCubit(Language.en),
      act: (cubit) => cubit.changeToSpanish(),
      expect: () => [equals(Language.es)],
    );
  });
}
