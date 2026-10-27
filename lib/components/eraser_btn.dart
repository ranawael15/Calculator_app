import 'package:flutter/material.dart';

class EraserBtn extends StatelessWidget {
  final String mytxt;
  final VoidCallback? onPressed;
  const EraserBtn({super.key, required this.mytxt, this.onPressed});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.grey[300]),
        overlayColor: WidgetStatePropertyAll(Colors.grey[400]),
        shape: const WidgetStatePropertyAll(CircleBorder()),
        minimumSize: WidgetStatePropertyAll(Size(deviceWidth / 4 - 15, 100)),
      ),
      child: Text(
        mytxt,
        style: TextStyle(
          fontSize: 40,
          color: Colors.red,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
