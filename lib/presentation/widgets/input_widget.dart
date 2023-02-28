import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String placeholderText;
  final TextInputType textInputType;
  final bool obscureText;

  const InputWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.placeholderText,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            hintText: placeholderText,
          ),
        ),
      ],
    );
  }
}
