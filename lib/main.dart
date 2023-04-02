import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CounterState(),
    child: const MaterialApp(home: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter',
            ),
            Consumer<CounterState>(
              builder: (context, counter, child) => Text('${counter.value}'),
            ),
            FloatingActionButton(
              onPressed: () {
                var counter = context.read<CounterState>();
                counter.updateCount();
              },
              child: const Icon(Icons.add),
            ),
          ],
        )));
  }
}

class CounterState extends ChangeNotifier {
  int value = 0;

  updateCount() {
    value += 1;
    notifyListeners();
  }
}

// class CounterApp extends StatelessWidget {
//   const CounterApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => CounterState(),
//       child: const CounterText(),
//     );
//   }
// }

// class CounterText extends StatelessWidget {
//   const CounterText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var state = Provider.of<CounterState>(context);

//     return Text('{$state.count}');
//   }
// }
