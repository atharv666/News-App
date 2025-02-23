import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technewzapp/components/components.dart';
import 'package:technewzapp/utils/colors.dart';
import 'package:technewzapp/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(BuildContext context, String title, String description, String imageurl, String url){
  showBottomSheet(
    backgroundColor: AppColors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    ),
    elevation: 20,
    context: context,
    builder: (context) {
      return BottomSheetLayout(title: title, imageurl: imageurl, description: description, url: url);
    },
  );
}


_launchURL(String url)async{
  final Uri URI = Uri.parse(url);
  if(await launchUrl(URI)){
    await launchUrl(URI);
  }
  else{
    log("Could not launch $url");
  }
}

class BottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;
  const BottomSheetLayout({super.key, required this.title, required this.imageurl, required this.description, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetImage(imageurl: imageurl, title: title,),
          Container(
            padding: EdgeInsets.all(10),
            child: modifiedText(text: description, size: 16, color: AppColors.white),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Read Full Article",
                    recognizer: TapGestureRecognizer()
                    ..onTap = (){
                      _launchURL(url);
                    },
                    style: GoogleFonts.lato(color: Colors.blue.shade400)
                  )
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}