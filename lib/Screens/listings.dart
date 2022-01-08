import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listing_project/Custom%20Widgets/icon_heading.dart';
import 'package:listing_project/Custom%20Widgets/search_bar.dart';
import 'package:listing_project/Data/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Listings extends StatefulWidget {
  const Listings({Key? key}) : super(key: key);

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  List <String?> pictures = [];
  List <String?> title = [];
  List <String?> descriptions = [];

  Future <void> getData () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = 0;
    while (prefs.getString('image$counter') != null) {
      pictures.add(prefs.getString('image$counter'));
      title.add(prefs.getString('imageTitle$counter'));
      descriptions.add(prefs.getString('imageDesc$counter'));
      print('added $counter');
      counter++;
    }
    setState(() {

    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Data.secondaryColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Container(
              margin: const EdgeInsets.only(left: 10),
              child: IconButton(
                icon: Icon(
                  CupertinoIcons.waveform_path,
                  color: Data.secondaryColor,
                ),
                onPressed: () {},
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.bell,
                  color: Data.secondaryColor,
                ),
                onPressed: () {},
              ),
            ],
            backgroundColor: Data.primaryColor,
            floating: true,
            expandedHeight: 180,
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  60,
                ),
                bottomRight: Radius.circular(
                  60,
                ),
              ),
            ),
            stretch: false,
            collapsedHeight: 180,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SearchBar(
                  prefixIcon: CupertinoIcons.search,
                  hintText: 'What category are you searching for?',
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context,int index) {
              if (pictures.isEmpty) {
                return Container(
                  color: Data.secondaryColor,
                  height: double.maxFinite,
                  child: const Center(
                    child: Text(
                      'No data exists!',
                    ),
                  ),
                );
              }
              else {
                return Container(
                  decoration: BoxDecoration(
                    color: Data.secondaryColor,
                  ),
                  child: Card(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 25,
                      right: 25,
                      bottom: 5,
                    ),
                    color: Data.secondaryColor,
                    child: ListTile(
                      title: Text(
                        title[index].toString(),
                        style: GoogleFonts.nunito(
                          fontSize: 22,
                          color: Data.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(descriptions[index].toString()),
                      leading: Image.file(
                        File(pictures[index]!),
                      ),
                    ),
                  ),
                );
              }
            },
              childCount: pictures.length,
            ),
          ),
        ],
        shrinkWrap: true,
      ),
    );
  }
}