import 'package:flutter/material.dart';
import 'package:technewzapp/utils/colors.dart';
import 'package:technewzapp/utils/text.dart';

class appBar extends StatelessWidget implements PreferredSizeWidget{
  appBar({super.key})
    : preferredSize = Size.fromHeight(50);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
        padding: EdgeInsets.only(left: 75),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldText(text: "Tech", size: 25, color: Colors.blue[900]!),
            BoldText(text: "Newz", size: 25, color: AppColors.white)
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}