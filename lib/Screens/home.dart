import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listing_project/Custom%20Widgets/search_bar.dart';
import 'package:listing_project/Data/data.dart';
import 'package:listing_project/Screens/add_data.dart';
import 'package:listing_project/Screens/listings.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          CupertinoIcons.add,
          color: Data.secondaryColor,
        ),
        backgroundColor: Data.primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return const AddData();
            }),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
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
            expandedHeight: 230,
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
            collapsedHeight: 230,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    left: 25,
                    right: 10,
                  ),
                  child: Text(
                    'Hi Sonia',
                    style: GoogleFonts.nunito(
                      color: Data.secondaryColor,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    // top: 5,
                    bottom: 5,
                    left: 25,
                    right: 10,
                  ),
                  child: Text(
                    'Welcome Back',
                    style: GoogleFonts.nunito(
                      color: Data.secondaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SearchBar(
                  prefixIcon: CupertinoIcons.search,
                  hintText: 'What category are you searching for?',
                ),
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 12,
                    right: 12,
                    bottom: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      35,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const Listings();
                        }),
                      );
                    },
                    tileColor: Data.dummyColors[index].withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        35,
                      ),
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              Data.secondaryColor.withOpacity(0.86),
                          radius: 45,
                          child: Icon(
                            Data.dummyIcons[index],
                            size: 45,
                            color: Data.dummyColors[index],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 15,
                          ),
                          child: Text(
                            Data.dummyCategories[index],
                            style: GoogleFonts.nunito(
                              color: Data.dummyColors[index],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 6,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1,
            ),
          ),
        ],
        shrinkWrap: true,
      ),
    );
  }
}
