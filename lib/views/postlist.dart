import 'package:flutter/material.dart';

import '../model/userdata.dart';
import '../model/userpost.dart';
import 'profileview.dart';

class Postlist extends StatefulWidget {
  const Postlist({super.key, required this.userdata});

  final Userdata userdata;

  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  var nametxtStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  void gotoPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    ).then((_) => setState(() {}));
  }

  Widget userline(Userpost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage(userPost.userimg),
          radius: 20,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nametxtStyle),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(userPost.time),
              const Text('.'),
              const Icon(Icons.group, size: 15, color: Colors.grey),
            ],
          ),
        ],
      ),
    ],
  );

  Widget postimage(Userpost userPost) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: [Text(userPost.postcontent)]),
        const SizedBox(height: 15),
        Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(userPost.postimg),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    ),
  );

  Widget counts(Userpost userPost) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('${userPost.numcomments} Comments'),
        const SizedBox(width: 20),
        Text('${userPost.numshare} Shares'),
      ],
    ),
  );

  Widget buttons(Userpost userPost) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: userPost.isLiked ? Colors.grey : Colors.blue,
          ),
          onPressed: () {},
          icon: const Icon(Icons.thumb_up, size: 20),
          label: const Text('Like'),
        ),
        TextButton.icon(
          style: TextButton.styleFrom(foregroundColor: Colors.grey),
          onPressed: () => gotoPage(
            context,
            ProfileView(userPost: userPost, userdata: widget.userdata),
          ),
          icon: const Icon(Icons.chat_bubble, size: 20),
          label: const Text('Comment'),
        ),

        TextButton.icon(
          style: TextButton.styleFrom(foregroundColor: Colors.grey),
          onPressed: () {},
          icon: const Icon(Icons.share, size: 20),
          label: const Text('Share'),
        ),
      ],
    ),
  );

  Widget showPost(Userpost userPost) => Column(
    children: [
      userline(userPost),
      postimage(userPost),
      counts(userPost),
      const Divider(),
      buttons(userPost),
      SizedBox(height: 10, child: Container(color: Colors.grey)),
      const SizedBox(height: 15),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: widget.userdata.userList.map((userPost) {
        return InkWell(
          onTap: () {
            gotoPage(
              context,
              ProfileView(userPost: userPost, userdata: widget.userdata),
            );
          },
          child: showPost(userPost),
        );
      }).toList(),
    );
  }
}
