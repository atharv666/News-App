import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:technewzapp/backend/functions.dart';
import 'package:technewzapp/components/appbar.dart';
import 'package:technewzapp/components/newsbox.dart';
import 'package:technewzapp/components/searchbar.dart';
import 'package:technewzapp/utils/colors.dart';
import 'package:technewzapp/utils/constants.dart';
import 'package:technewzapp/utils/text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;
  String isselected = "Technology";

  @override
  void initState() {
    super.initState();
    news = fetchnews(category: isselected.toLowerCase());
  }
  
  void updateNews(List newData){
    setState(() {
      news = Future.value(newData);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = ["Technology", "Business", "Entertainment", "General", "Health", "Science", "Sports"];
    List<IconData> icons = [Icons.laptop_mac_rounded, Icons.business, Icons.live_tv_rounded, Icons.travel_explore, Icons.health_and_safety_outlined, Icons.science_outlined, Icons.sports_esports_outlined];

    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(radius: 40, backgroundImage: NetworkImage('https://media.istockphoto.com/id/183036991/photo/a-world-news-graphic-of-a-blue-globe-with-news-categories.jpg?s=612x612&w=0&k=20&c=PNpxTaeTefDi6ueRjCUS8KdXuxqoTIHiTHFTOQs0g_4='),),
                  SizedBox(width: 25,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BoldText(text: "News", size: 25, color: AppColors.white),
                      BoldText(text: "Categories", size: 25, color: AppColors.white),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: modifiedText(text: categories[index], size: 20, color: Colors.blue),
                    leading: Icon(icons[index]),
                    tileColor: isselected == categories[index]? Colors.blue[900] : Colors.transparent,
                    onTap: (){
                      setState(() {
                        isselected = categories[index];
                        news = fetchnews(category: isselected.toLowerCase());
                        Fluttertoast.showToast(msg: "$isselected selected.");
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.black,
      appBar: appBar(),
      body: Column(
        children: [
          Searchbar(onSearch: updateNews),
          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder(
                future: news,
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NewsBox(
                          url: snapshot.data![index]['url'],
                          imageurl: snapshot.data![index]['urlToImage'] != null ? snapshot.data![index]['urlToImage'] : Constants.imageurl,
                          title: snapshot.data![index]['title'],
                          time: snapshot.data![index]['publishedAt'],
                          description: snapshot.data![index]['description'].toString(),
                        );
                      },
                    );
                  }
                  else if(snapshot.hasError){
                    return Text("${snapshot.error}");
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
          ),
          // ElevatedButton(
          //   onPressed: (){},
          //   child: Text("Load More"),
          // ),
        ],
      ),
    );
  }
}