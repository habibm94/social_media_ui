import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';

import '../view/homeScreen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  image: AssetImage(currentUser.backgroundImageUrl!),
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2.0)),
                        width: 120,
                        height: 120,
                        child: ClipOval(
                          child: Image(
                            image: AssetImage(
                              currentUser.profileImageUrl!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        currentUser.name!,
                        style: TextStyle(
                            color: CupertinoColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            wordSpacing: 6),
                      )
                    ],
                  ),
                  left: 20,
                  bottom: 20,
                )
              ],
            ),
            DrawerItems(
                Icon(
                  Icons.dashboard,
                ),
                'Home',
                HomeScreen()),
            DrawerItems(
                Icon(
                  Icons.dashboard,
                ),
                'Chat',
                HomeScreen()),
            DrawerItems(
                Icon(
                  Icons.dashboard,
                ),
                'Profile',
                HomeScreen()),
            DrawerItems(
                Icon(
                  Icons.dashboard,
                ),
                'Settings',
                HomeScreen()),
            Expanded(
                child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: DrawerItems(
                  Icon(
                    Icons.dashboard,
                  ),
                  'LogOut',
                  HomeScreen()),
            ))
          ],
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  Icon icon;
  String text;
  Widget screen;
  DrawerItems(this.icon, this.text, this.screen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: icon,
        title: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
        onTap: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => screen)));
  }
}

class DrawerBuilder extends StatelessWidget {
  Icon drawerIcon;
  String name;
  Function onTap;
  DrawerBuilder(
      {Key? key,
      required this.onTap,
      required this.drawerIcon,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(fontSize: 20.0),
      ),
      leading: drawerIcon,
      onTap: onTap(),
    );
  }
}
