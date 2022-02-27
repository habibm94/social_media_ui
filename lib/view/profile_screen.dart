import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_ui/widgets/custom_drawer.dart';
import 'package:social_media_ui/widgets/postCarousel.dart';

import '../models/user_model.dart';
import '../widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  ProfileScreen({required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  PageController? _yourPost_PageController;
  PageController? _yourfollowingPost_PageController;
  @override
  void initState() {
    super.initState();
    _yourPost_PageController =
        PageController(initialPage: 0, viewportFraction: 0.5);
    _yourfollowingPost_PageController =
        PageController(initialPage: 0, viewportFraction: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    image: AssetImage(widget.user.backgroundImageUrl!),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 45,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                  ),
                  top: 30,
                  left: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        )
                      ],
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2.0)),
                  width: 100,
                  height: 100,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(
                        widget.user.profileImageUrl!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                  child: Text(
                widget.user.name!,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Following',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.grey[700]),
                      ),
                      Text(
                        widget.user.following.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text('Followers',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.grey[700])),
                      Text(
                        widget.user.followers.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            PostCarousel(
                pageController: _yourPost_PageController,
                carouseltitle: 'Your Posts',
                posts: widget.user.posts!),
            const SizedBox(
              height: 3,
            ),
            PostCarousel(
                pageController: _yourfollowingPost_PageController,
                carouseltitle: 'Your Favorites',
                posts: widget.user.favorites!),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
