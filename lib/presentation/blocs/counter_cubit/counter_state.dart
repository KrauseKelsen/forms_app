part of 'counter_cubit.dart';
//Equatable es un paquete que permite comparar los parametros de un estado con otro y determinar si son el mismo, es muy usado
class CounterState extends Equatable {
  //se estaran emitiendo copias del CounterState mediante el copyWith el cual define los args que se copian
  //los estados SON INMUTABLES, esto es algo bueno de Bloc, permite un mejor manejo de los estados
  final int counter;
  final int transactionCount;

  const CounterState({this.counter = 0, this.transactionCount = 0});

  copyWith({
    int? counter,
    int? transactionCount,
  }) =>
      CounterState(
          counter: counter ?? this.counter,
          transactionCount: transactionCount ?? this.transactionCount);

  @override
  List<Object> get props => [counter, transactionCount];
}
