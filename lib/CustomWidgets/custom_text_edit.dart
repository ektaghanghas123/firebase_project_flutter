import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{

  final TextEditingController controller;
  final String label;
  final String? hint;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const CustomTextField({super.key, required this.controller, required this.label,
    this.hint, required this.obscureText, this.prefixIcon, this.suffixIcon,  this.keyboardType = TextInputType.text,
    this.validator, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 12,color: Colors.black),
      controller: controller,
      validator: validator,
      autocorrect: false,
      onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),


    );
  }
}