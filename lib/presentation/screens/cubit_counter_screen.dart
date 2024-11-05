import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

//Los cubits ya vienen con bloc
//Mi cubit bloc solo va vivir en esta pantalla
class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Toda la vista recibe el CounterCubit y iene acceso a el
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    //podemos escuchar los cambios que tiene el CounterState, esto no esta bien en este ejercicio ya que cada que redibuja la pantalla se pierden los estados
    //lo que incurre a que el counter value:0 no sea detectado, esto se soluciona usando Equatable
    //final counterState = context.watch<CounterCubit>().state; //cuando el state cambia el watch observa

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) {
          return Text('Cubit Counter: ${value.state.transactionCount}'); //esto es lo mismo que usar BlocBuilder
        }),
        actions: [
          IconButton(
              onPressed: () => {context.read<CounterCubit>().reset()},
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      //Los bloc y cubits son implementados solo en los pedazos de codigo que son envueltos por un builder
      //Esto ahorra mucha memoria, pues a diferencia de Riverpod quien evalua cada linea de codigo, redibujando aquellos widgets que sufren cambios,
      //bloc y cubits solo realiza cambios en aquellos widgets que cambian su estado
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          //buildWhen: (previous, current) => current.counter != previous.counter, //reconstruye el builder solo cuando cambia
          builder: (context, state) {
            print('counter cambio');
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1',
              child: const Text('+3'),
              onPressed: () => increaseCounterBy(context, 3)),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '2',
              child: const Text('+2'),
              onPressed: () => increaseCounterBy(context, 2)),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '3',
              child: const Text('+1'),
              onPressed: () => increaseCounterBy(context, 1)),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
