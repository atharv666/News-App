import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technewzapp/backend/functions.dart';
import 'package:technewzapp/utils/colors.dart';

class Searchbar extends StatefulWidget {
  final Function onSearch;
  Searchbar({required this.onSearch});
  static TextEditingController searchbarcontroller = TextEditingController(text: '');

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: AppColors.darkgrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: TextField(
                controller: Searchbar.searchbarcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search a keyword or a Phrase",
                  hintStyle: GoogleFonts.lato(),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.darkgrey,
            shape: BoxShape.circle,
          ),
          // child: Icon(Icons.search, size: 27,),
          child: IconButton(
            icon: Icon(Icons.search, size: 27,),
            onPressed: ()async{
              FocusScope.of(context).unfocus();
              List newsResults = await fetchnews();
              widget.onSearch(newsResults);
            },
          ),
        )
      ],
    );
  }
}