import 'package:flutter/material.dart';

class OperateBtn extends StatelessWidget {
  final String mytxt;
  final VoidCallback onPressed;
  const OperateBtn({super.key, required this.mytxt, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.grey[300]),
        overlayColor: WidgetStatePropertyAll(Colors.grey[400]),
        shape: const WidgetStatePropertyAll(CircleBorder()),
        minimumSize: WidgetStatePropertyAll(Size(deviceWidth / 4 - 15, 100)),
      ),
      onPressed: onPressed,
      child: Text(
        mytxt,

        style: TextStyle(
          fontSize: 40,
          color: Colors.green,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
