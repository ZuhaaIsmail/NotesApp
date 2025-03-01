import 'package:flutter/material.dart';

Widget myTextField(String hintText, TextEditingController controller, int lines) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      filled: true,
      fillColor: Colors.grey[200],
    ),
    maxLines: lines,
  );
}