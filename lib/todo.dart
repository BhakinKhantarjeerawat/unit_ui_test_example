import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_test/main.dart';
import 'package:learn_test/my_home_page.dart';
import 'package:learn_test/provider/counter.dart';

class TodoList extends ConsumerStatefulWidget {
  const TodoList({super.key});

  @override
  ConsumerState<TodoList> createState() => _TodoListState();
}

class _TodoListState extends ConsumerState<TodoList> {
  static const _appTitle = 'Todo List';
  final todos = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final temperature = ref.watch(temperatureProvider);
    return MaterialApp(
      title: _appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_appTitle),
        ),
        body: Column(
          children: [
            const Text('Reduce1'),
            Text(temperature.toString()),
            TextField(
              controller: controller,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyApp()));
                },
                child: const Text('To MyApp')),
            ElevatedButton(onPressed: () {
                ref.read(temperatureProvider.notifier).state--;
            }, child: const Text('Reduce')),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];

                  return Dismissible(
                    key: Key('$todo$index'),
                    onDismissed: (direction) => todos.removeAt(index),
                    background: Container(color: Colors.red),
                    child: ListTile(title: Text(todo)),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              todos.add(controller.text);
              controller.clear();
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
