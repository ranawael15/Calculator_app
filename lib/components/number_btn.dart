import 'package:flutter/material.dart';

class NumberBtn extends StatelessWidget {
  final String mytxt;
  final VoidCallback? onPressed;
  const NumberBtn({super.key, required this.mytxt, this.onPressed});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        overlayColor: WidgetStatePropertyAll(Colors.grey[300]),
        shape: WidgetStatePropertyAll(CircleBorder()),
        minimumSize: WidgetStatePropertyAll(Size(deviceWidth / 4 - 15, 100)),
      ),
      child: Text(
        mytxt,
        style: TextStyle(
          fontSize: 40,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
