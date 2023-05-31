import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyperhire/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final commentController = TextEditingController();

  Widget postCard(post, height, width) {
    final user = users[post['user']];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Information about the User of the Post
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Post's User's profile Image
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            (user['profile_image_link']).toString()),
                        radius: height * 0.0225,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              //Post's User's Name
                              Text(
                                user['name'].toString(),
                                style: GoogleFonts.notoSans(
                                    fontWeight: FontWeight.w700, fontSize: 14),
                              ),
                              if (user['verified'] == false) const Text("  "),
                              if (user['verified'] == true)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.0075),
                                  child: Icon(
                                    Icons.check_circle_rounded,
                                    color: const Color(0xff01b99f),
                                    size: height * 0.02,
                                  ),
                                ),

                              // Duration passed after the post was posted
                              Text(
                                "${post['duration']}일전",
                                style: GoogleFonts.notoSans(
                                    color: const Color(0xff919eb6),
                                    fontSize: 10),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("${(user['height']).toString()}cm",
                                  style: GoogleFonts.notoSans(
                                      color: const Color(0xff919eb6),
                                      fontSize: 12)),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Icon(
                                  Icons.circle,
                                  color: Color(0xff919eb6),
                                  size: 3,
                                ),
                              ),
                              Text("${(user['weight']).toString()}kg",
                                  style: GoogleFonts.notoSans(
                                      color: const Color(0xff919eb6),
                                      fontSize: 12))
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  // Follow Button
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff01b99f)),
                      child: Text(
                        "팔로우",
                        style: GoogleFonts.notoSans(
                            color: Colors.white, fontSize: 12),
                      ))
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),

              // Title of the post
              Text(
                post['title'],
                style: GoogleFonts.notoSans(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: height * 0.02,
              ),

              // Content of the post
              Text(
                post['content'],
                textAlign: TextAlign.justify,
                style: GoogleFonts.notoSans(
                    fontSize: 12, color: const Color(0xff313b49)),
              ),
              SizedBox(
                height: height * 0.015,
              ),

              // Tags of the post

              Wrap(
                children: [
                  for (int i = 0; i < post['tags'].length; i++) ...[
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xfff7f8fa),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: const Color(0xffced3de), width: 0.5)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      margin: const EdgeInsets.only(right: 8, bottom: 8),
                      child: Text(
                        "#${post['tags'][i]}",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: const Color(0xff5a6b87),
                        ),
                      ),
                    )
                  ]
                ],
              ),
              SizedBox(
                height: height * 0.015,
              ),
            ],
          ),
        ),

        // Post Image
        Image.network(
          post['image_link'],
          width: width,
          height: width * 1.1,
          fit: BoxFit.cover,
        ),

        SizedBox(
          height: height * 0.005,
        ),

        // Like, comment, save Icons of the post
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        CupertinoIcons.heart,
                        color: Color(0xffafb9ca),
                      )),
                  SizedBox(
                    width: width * 0.0075,
                  ),
                  Text(
                    " ${post['likes']}   ",
                    style: GoogleFonts.notoSans(
                        fontSize: 12, color: const Color(0xffafb9ca)),
                  ),
                  SizedBox(
                    width: width * 0.0175,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.message_outlined,
                        color: Color(0xffafb9ca),
                      )),
                  SizedBox(
                    width: width * 0.0075,
                  ),
                  Text(
                    " ${post['comments']['total']}   ",
                    style: GoogleFonts.notoSans(
                        fontSize: 12, color: const Color(0xffafb9ca)),
                  ),
                  SizedBox(
                    width: width * 0.0175,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        CupertinoIcons.bookmark,
                        color: Color(0xffafb9ca),
                      )),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.more_horiz,
                        color: Color(0xffafb9ca),
                      ))
                ],
              )
            ],
          ),
        ),
        const Divider(
          height: 2,
          color: Color(0xfff7f8fa),
        ),
        SizedBox(
          height: height * 0.01,
        ),

        // Comment Section
        if (post['comments']['total'] != 0)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              children: [
                // List of Main Comments
                for (int i = 0;
                    i < post['comments']['comments'].length;
                    i++) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Main Comment User Details
                      Row(
                        children: [
                          CircleAvatar(
                            radius: height * 0.0225,
                            backgroundImage: NetworkImage(
                                (users[post['comments']['comments'][i]['user']]
                                        ['profile_image_link'])
                                    .toString()),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            (users[post['comments']['comments'][i]['user']]
                                    ['name'])
                                .toString(),
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                          if (users[post['comments']['comments'][i]['user']]
                                  ['verified'] ==
                              false)
                            const Text("  "),
                          if (users[post['comments']['comments'][i]['user']]
                                  ['verified'] ==
                              true)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.0075),
                              child: Icon(
                                Icons.check_circle_rounded,
                                color: const Color(0xff01b99f),
                                size: height * 0.02,
                              ),
                            ),
                          Text(
                            "${post['comments']['comments'][i]['duration']}일전",
                            style: GoogleFonts.notoSans(
                                color: const Color(0xff919eb6), fontSize: 10),
                          )
                        ],
                      ),
                      // More Option Button
                      IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Color(0xffafb9ca),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: height * 0.0225 * 2 + width * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Content of the main comment
                        Text(
                          post['comments']['comments'][i]['comment'],
                          style: GoogleFonts.notoSans(
                              fontSize: 12, color: const Color(0xff313b49)),
                        ),
                        // Like icon and Comment icon under the following comment
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    CupertinoIcons.heart,
                                    size: height * 0.025,
                                    color: const Color(0xffafb9ca),
                                  )),
                              SizedBox(
                                width: width * 0.005,
                              ),
                              Text(
                                " ${post['comments']['comments'][i]['likes']}   ",
                                style: GoogleFonts.notoSans(
                                    fontSize: 9.35,
                                    color: const Color(0xffafb9ca)),
                              ),
                              SizedBox(
                                width: width * 0.0225,
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.message_outlined,
                                    size: height * 0.019,
                                    color: const Color(0xffafb9ca),
                                  )),
                              SizedBox(
                                width: width * 0.005,
                              ),
                              Text(
                                " ${post['comments']['comments'][i]['subcomments'].length}  ",
                                style: GoogleFonts.notoSans(
                                    fontSize: 9.35,
                                    color: const Color(0xffafb9ca)),
                              ),
                            ],
                          ),
                        ),

                        // List of all subcomments
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int j = 0;
                                j <
                                    post['comments']['comments'][i]
                                            ['subcomments']
                                        .length;
                                j++) ...[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      //Post's User's profile Image
                                      CircleAvatar(
                                        radius: height * 0.0225,
                                        backgroundImage: NetworkImage((users[
                                                    post['comments']['comments']
                                                                [i]
                                                            ['subcomments']
                                                        [j]['user']]
                                                ['profile_image_link'])
                                            .toString()),
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Text(
                                        (users[post['comments']['comments'][i]
                                                    ['subcomments'][j]['user']]
                                                ['name'])
                                            .toString(),
                                        style: GoogleFonts.notoSans(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14),
                                      ),
                                      if (users[post['comments']['comments'][i]
                                                  ['subcomments'][j]['user']]
                                              ['verified'] ==
                                          false)
                                        const Text("  "),
                                      if (users[post['comments']['comments'][i]
                                                  ['subcomments'][j]['user']]
                                              ['verified'] ==
                                          true)
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.0075),
                                          child: Icon(
                                            Icons.check_circle_rounded,
                                            color: const Color(0xff01b99f),
                                            size: height * 0.02,
                                          ),
                                        ),
                                      Text(
                                        "${post['comments']['comments'][i]['subcomments'][j]['duration']}일전",
                                        style: GoogleFonts.notoSans(
                                            color: const Color(0xff919eb6),
                                            fontSize: 10),
                                      )
                                    ],
                                  ),
                                  // More Option Button
                                  IconButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    icon: const Icon(
                                      Icons.more_horiz,
                                      color: Color(0xffafb9ca),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: height * 0.0225 * 2 + width * 0.02,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      post['comments']['comments'][i]
                                          ['subcomments'][j]['comment'],
                                      style: GoogleFonts.notoSans(
                                          fontSize: 12,
                                          color: const Color(0xff313b49)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: height * 0.01),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                              onTap: () {},
                                              child: Icon(
                                                CupertinoIcons.heart,
                                                size: height * 0.025,
                                                color: const Color(0xffafb9ca),
                                              )),
                                          SizedBox(
                                            width: width * 0.005,
                                          ),
                                          Text(
                                            " ${post['comments']['comments'][i]['subcomments'][j]['likes']} ",
                                            style: GoogleFonts.notoSans(
                                                fontSize: 9.35,
                                                color: const Color(0xffafb9ca)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                          ],
                        ),
                      ],
                    ),
                  ),
                ]
              ],
            ),
          ),
        SizedBox(
          height: height * 0.1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "POSTS",
            style:
                GoogleFonts.notoSans(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xff313b49),
              )),
          primary: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.bell,
                  color: Color(0xffafb9ca),
                ))
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                for (int i = 0; i < posts.length; i++) ...[
                  postCard(posts[i], height, width)
                ]
              ],
            ),
          ),

          // Below comment typing section on the screen
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.white,
              width: width,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.image_outlined,
                        color: Color(0xff919eb6),
                        size: 20,
                      )),
                  Expanded(
                    child: TextFormField(
                      controller: commentController,
                      decoration: InputDecoration(
                          hintText: "댓글을 남겨주세요.",
                          hintStyle: GoogleFonts.notoSans(
                              fontSize: 12, color: const Color(0xffafb9ca)),
                          border: InputBorder.none),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Text(
                      "등록",
                      style: GoogleFonts.notoSans(
                          fontSize: 12, color: const Color(0xff919eb6)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
