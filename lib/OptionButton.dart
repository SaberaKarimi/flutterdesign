import 'package:flutter/material.dart';
import 'package:flutterdesign/constants.dart';
import 'package:flutterdesign/widget_functions.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const OptionButton(
      {super.key, required this.text, required this.icon, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: FlatButton(
        minWidth: width,
        color: COLOR_DARK_BLUE,
        splashColor: COLOR_White.withAlpha(55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              icon,
              color: COLOR_White,
            ),
            adHorizontalSpace(10),
            Text(
              text,
              style: TextStyle(color: COLOR_White),
            )
          ],
        ),
      ),
    );
  }
}

//
// class OptionButton extends StatelessWidget {
//   final String text;
//   final IconData icon;
//   final double width;
//
//   const OptionButton(
//
//       { super.key ,required this.text, required this.icon, required this.width});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       child: TextButton
//         (
//           style: TextButton.styleFrom(
//             primary: COLOR_DARK_BLUE,
//             backgroundColor: COLOR_WHITE,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
//           ),
//       // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       onPressed: () {},
//       child: Row(
//         children: [
//           Icon(icon, color: COLOR_WHITE),
//           addHorizontalSpace(10),
//           Text(
//             text,
//             style: TextStyle(color: COLOR_WHITE),
//           )
//         ],
//       ),
//     ),);
//   }
// }
