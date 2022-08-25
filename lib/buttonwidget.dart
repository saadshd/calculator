import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final Color? btncolor;
  final Color? textcolor;
  final String text;
  final double? textsize;
  final Function onPress;

  const button({
    super.key,
    this.btncolor,
    this.textcolor = Colors.black,
    required this.text,
    required this.onPress,
    this.textsize = 26,});




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: btncolor,
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
                color: textcolor,
                fontSize: textsize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
