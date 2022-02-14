import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/models/user_model.dart';

class following_User extends StatelessWidget {
  List<User> users;
  following_User({required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          color: Colors.black12,
          blurRadius: 2,
        )
      ]),
      height: 70,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: users.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext contect, int index) {
            User user = users[index];
            return Container(
              padding: EdgeInsets.all(4),
              height: 40.0,
              width: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image(
                  image: AssetImage(user.profileImageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}
