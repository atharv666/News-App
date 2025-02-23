import 'package:flutter/material.dart';
import 'package:technewzapp/utils/colors.dart';
import 'package:technewzapp/utils/text.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Divider(
        color: AppColors.lightwhite,
      ),
    );
  }
}


class BottomSheetImage extends StatelessWidget {
  final String imageurl, title; 
  const BottomSheetImage({super.key, required this.imageurl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
              )
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageurl),
                fit: BoxFit.cover,
              )
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              width: 300, 
              padding: EdgeInsets.all(10),
              child: BoldText(text: title, size: 18, color: AppColors.white)
            ),
          ),
        ],
      ),
    );
  }
}