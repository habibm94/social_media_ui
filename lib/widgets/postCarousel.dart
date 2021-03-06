import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';

import '../models/post_model.dart';

class PostCarousel extends StatelessWidget {
  final PageController? pageController;
  final String carouseltitle;
  final List<Post> posts;

  PostCarousel(
      {required this.pageController,
      required this.carouseltitle,
      required this.posts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Text(
            carouseltitle,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
        ),
        Container(
          height: 300,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 2), blurRadius: 6.0),
          ]),
          child: PageView.builder(
            scrollBehavior: const CupertinoScrollBehavior(),
            controller: pageController,
            itemBuilder: (BuildContext context, int index) {
              Post post = posts[index];
              return AnimatedBuilder(
                animation: pageController!,
                builder: (BuildContext context, Widget? widget) {
                  double value = 1;
                  if (pageController!.position.haveDimensions) {
                    value = pageController!.page! - index;
                    value = (1 - (value.abs()) * 0.4).clamp(00, 1);
                  }
                  return Center(
                    child: SizedBox(
                      height: Curves.easeInOut.transform(value) * 400,
                      child: widget,
                    ),
                  );
                },
                child: Stack(
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
                      margin: const EdgeInsets.all(6.0),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          image: AssetImage(post.imageUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 300,
                    ),
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
                          padding: const EdgeInsets.all(7.0),
                          child: Column(
                            children: [
                              Text(
                                post.title!,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                post.location!,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 50.0),
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
                      bottom: 6.45,
                      left: 6.45,
                      right: 6.45,
                    ),
                  ],
                ),
              );
            },
            itemCount: posts.length,
          ),
        )
      ],
    );
  }
}
