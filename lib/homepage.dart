import 'package:bloc_demo/counter_bloc.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _counter = 0;
  final counterBloc = CounterBLoc();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times'),
            StreamBuilder(
              stream: counterBloc.counterstream,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  '{$snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventsink.add(CounterAction.Increment);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventsink.add(CounterAction.Decrement);
            },
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventsink.add(CounterAction.Reset);
            },
            tooltip: 'Increment',
            child: Icon(Icons.loop),
          ),
        ],
      ),
    );
  }
}
