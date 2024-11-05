part of 'counter_bloc.dart';

// permite determinar que tipos de eventos va recibir el bloc
// no se pueden crear instancias del evento
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => []; // esto es usado para comprar eventos pero no se comparan en este ejercicio
}

class CounterIncreased extends CounterEvent {
  final int value;

  const CounterIncreased(this.value);
}

class CounterReset extends CounterEvent {

  const CounterReset();
}

//se pueden crear otros eventos
