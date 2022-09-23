import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? btnColor;
  final Color? textColor;
  final String text;
  final double? textSize;
  final Function onPress;

  const MyButton({
    super.key,
    this.btnColor,
    this.textColor = Colors.black,
    required this.text,
    required this.onPress,
    this.textSize = 28,
    });




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: btnColor,
          child: SizedBox(
            width: 56,
            height: 56,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.black12),
              ),
              onPressed: () {
                onPress(text);
              },
              child: Text(text,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
