import 'package:flutter/material.dart';

class CustomOtpTextField extends StatelessWidget {
  final List<TextEditingController> controllers;
  final int otpLength;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  const CustomOtpTextField({
    super.key,
    required this.controllers,
    this.otpLength = 6,
    this.onChanged,
    this.keyboardType = TextInputType.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        otpLength,
            (index) => SizedBox(
          width: 40,
          child: TextField(
            controller: controllers[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onChanged: (value) {
              onChanged?.call(value);
              if (value.isNotEmpty && index < otpLength - 1) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
      ),
    );
  }
}
