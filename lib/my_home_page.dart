import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_test/constants/app_sizes.dart';
import 'package:learn_test/global_widgets.dart/my_text_form_field.dart';
import 'package:learn_test/global_widgets.dart/primary_button.dart';
import 'package:learn_test/todo.dart';

final temperatureProvider = StateProvider<int>((ref) {
  return 0;
});

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});
  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final temperature = ref.watch(temperatureProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // controller.increment();
          ref.read(temperatureProvider.notifier).state++;
          log(temperatureProvider.toString());
        },
      ),
      backgroundColor: const Color.fromARGB(255, 244, 231, 217),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TodoList()));
                  },
                  child: const Text("todo")),
              ElevatedButton(
                  onPressed: () {
                    showAboutDialog(context: context, children: [
                      const Text(key: Key("signInDialog"), "dialogAppears")
                    ]);
                  },
                  child: const Text("showDialog")),
              Text(temperature.toString()),
              MyTextFormField(
                key: const Key('first_name_text_form_field'),
                controller: firstNameController,
              ),
              gapH16,
              MyTextFormField(
                controller: lastNameController,
              ),
              gapH4,
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.only(right: 16),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'forget password?',
                          style: TextStyle(fontSize: 16),
                        )),
                  )),
              gapH32,
              PrimaryButton(
                padding: 16,
                child: Text(
                  "Sign in",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
                onPressed: () {},
              ),
              gapH4,
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'No account? Register',
                    style: TextStyle(fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
