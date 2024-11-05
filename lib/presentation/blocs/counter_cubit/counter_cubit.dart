import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

//Tiene acceso al estado, esto es como un provider, se pueden tener metodos y propiedades que no estan amarradas al estado
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 5));
  //Los metodos del Cubit emiten nuevos estados del State

  void increaseBy(int value) {
    //state.counter = 10; esto no se puede, EL ESTADO ES INMUTABLE
    //Si quiero emitir un nuevo estado...uso el copyWith, si no cambio las propiedades copyWith emite las estado anterior
    emit(state.copyWith(
      counter: state.counter + value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void reset() {
    emit(state.copyWith(
      counter: 0,
    ));
  }
}
