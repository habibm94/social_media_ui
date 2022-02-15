import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';

import '../models/post_model.dart';

class PostCarousel extends StatelessWidget {
  PageController? pageController;
  String carouseltitle;
  List<Post> posts;

  PostCarousel(
      {required this.pageController,
      required this.carouseltitle,
      required this.posts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Text(
            'Posts',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
        ),
        Container(
          height: 300,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 2), blurRadius: 6.0),
          ]),
          child: PageView.builder(
            padEnds: false,
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            itemBuilder: (BuildContext context, int index) {
              Post post = posts[index];
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.transparent,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 6.0),
                        ]),
                    margin: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(
                        image: AssetImage(post.imageUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 300,
                  ),
                  // Positioned(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.only(
                  //           bottomLeft: Radius.circular(15.0),
                  //           bottomRight: Radius.circular(15.0),
                  //         ),
                  //         color: Colors.white54),
                  //     height: 100.0,
                  //   ),
                  //   bottom: 0,
                  //   left: 0,
                  //   right: 0,
                  // ),
                  Positioned(
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                          color: Colors.white54),
                      height: 100.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              post.title!,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              post.location!,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 60.0),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red[400],
                                      ),
                                      Text(post.likes!.toString())
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.comment,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      Text(post.likes!.toString())
                                    ],
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                      ),
                    ),
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                ],
              );
            },
            itemCount: posts.length,
          ),
        )
      ],
    );
  }
}
