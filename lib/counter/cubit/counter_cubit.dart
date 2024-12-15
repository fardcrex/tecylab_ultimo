import 'package:bloc/bloc.dart';
import 'package:tecylab_final/app/view/app.dart';

class CounterCubit extends Cubit<Language> {
  CounterCubit(super.state);

  void changeToEnglish() => emit(Language.en);

  void changeToSpanish() => emit(Language.es);
}
