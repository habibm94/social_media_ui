import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/widgets/follwingUser_listview.dart';
import 'package:social_media_ui/widgets/postCarousel.dart';

import '../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _homescreenTabController;
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homescreenTabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          'Frenzy',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
              letterSpacing: 5.0),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: _homescreenTabController,
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            labelColor: Theme.of(context).primaryColor,
            indicatorWeight: 3.0,
            unselectedLabelStyle: TextStyle(fontSize: 18.0),
            tabs: const [
              Tab(
                text: 'Trending',
              ),
              Tab(
                text: 'Latest',
              )
            ],
          ),
          ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text(
                  'Friends',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
                ),
              ),
              following_User(
                users: users,
              ),
              PostCarousel(
                  pageController: _pageController,
                  carouseltitle: "Posts",
                  posts: posts),
            ],
          )
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
