import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/view/profile_screen.dart';

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
      child: SizedBox(
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
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        currentUser.name!,
                        style: const TextStyle(
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
                const Icon(
                  Icons.dashboard,
                ),
                'Chat',
                const HomeScreen()),
            DrawerItems(
                const Icon(
                  Icons.dashboard,
                ),
                'Profile',
                ProfileScreen(
                  user: currentUser,
                )),
            DrawerItems(
                const Icon(
                  Icons.dashboard,
                ),
                'Settings',
                const HomeScreen()),
            Expanded(
                child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: DrawerItems(
                  const Icon(
                    Icons.dashboard,
                  ),
                  'LogOut',
                  const HomeScreen()),
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
          style: const TextStyle(fontSize: 18),
        ),
        onTap: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => screen)));
  }
}
