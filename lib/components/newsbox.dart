import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technewzapp/components/bottomsheet.dart';
import 'package:technewzapp/components/components.dart';
import 'package:technewzapp/utils/colors.dart';
import 'package:technewzapp/utils/text.dart';

class NewsBox extends StatefulWidget {
  final String url, imageurl, title, time, description;
  const NewsBox({super.key, required this.url, required this.imageurl, required this.title, required this.time, required this.description});

  @override
  State<NewsBox> createState() => _NewsBoxState();
}

class _NewsBoxState extends State<NewsBox> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: (){
            showMyBottomSheet(context, widget.title, widget.description, widget.imageurl, widget.url);
          },
          child: Container(
            width: w,
            color: AppColors.black,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.imageurl,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        )
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return CircularProgressIndicator(color: AppColors.primary,);
                  },
                  errorWidget: (context, url, error) {
                    log(error.toString());
                    return Icon(Icons.error);
                  },
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      modifiedText(text: widget.title, size: 16, color: AppColors.white),
                      SizedBox(
                        height: 5,
                      ),
                      modifiedText(text: widget.time, size: 12, color: AppColors.white)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        DividerWidget(),
      ],
    );
  }
}