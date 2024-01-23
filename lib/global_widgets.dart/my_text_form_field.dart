import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTextFormField extends ConsumerStatefulWidget {
  const MyTextFormField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyTextFormFieldState();
}

class _MyTextFormFieldState extends ConsumerState<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2, color: Colors.grey.shade300), //<-- SEE HERE
              // borderRadius: BorderRadius.circular(50.0),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.redAccent),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.blue),
            ),
          )),
    );
  }
}
