import 'package:flutter/material.dart';

class ButtonCalc extends StatelessWidget {
  const ButtonCalc({
    super.key,
    required this.text,
    required this.onPressed,
    this.colors,
  });

  final String text;
  final VoidCallback onPressed;
  final Color? colors;

  @override
  Widget build(BuildContext context) {
    final Color baseColor = colors ?? const Color(0xFF1E1E2C);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                colors: [
                  baseColor.withOpacity(0.9),
                  baseColor.withOpacity(0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: baseColor.withOpacity(0.5),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
