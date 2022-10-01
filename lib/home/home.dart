import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kuldii_06_state_management_bloc_consumer/bloc/counter.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});
  MyCounter myCounter = MyCounter(startNum: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BLOC CONSUMER"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<MyCounter, int>(
              bloc: myCounter,
              builder: (context, state) {
                return Text("$state", style: const TextStyle(fontSize: 50));
              },
              listener: (context, state) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("RUN!")));
              },
              buildWhen: (previous, current) {
                if (current >= 10) {
                  return true;
                } else {
                  return false;
                }
              },
              listenWhen: (previous, current) {
                if (current == 15) {
                  return true;
                } else {
                  return false;
                }
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      myCounter.decrement();
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      myCounter.increment();
                    },
                    icon: const Icon(Icons.add)),
              ],
            )
          ],
        ));
  }
}
