import 'package:flutter/material.dart';

import '../model/userdata.dart';
import '../model/usercomment.dart';
import '../model/userpost.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    super.key,
    required this.userPost,
    required this.userdata,
  });

  final Userpost userPost;
  final Userdata userdata;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController commentController = TextEditingController();
  final FocusNode commentFocus = FocusNode();
  final ScrollController scrollController = ScrollController();

  var nametxtStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  var smallTxtStyle = const TextStyle(fontSize: 13);

  @override
  void dispose() {
    commentController.dispose();
    commentFocus.dispose();
    scrollController.dispose();
    super.dispose();
  }

  Widget avatar(String img, double radius) =>
      CircleAvatar(backgroundImage: AssetImage(img), radius: radius);

  void submitComment() {
    final text = commentController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      widget.userPost.addComment(widget.userdata.myUserAccount, text);
    });
    commentController.clear();
    FocusScope.of(context).unfocus();
    scrollToLatest();
  }

  void scrollToLatest() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!scrollController.hasClients) return;
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  Widget buttons(Userpost userPost) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Divider(color: Colors.grey),
      Padding(
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
              onPressed: () => commentFocus.requestFocus(),
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
      ),
      const Divider(color: Colors.grey),
    ],
  );

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

  Widget commenters(Userpost userPost) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${userPost.numcomments} Comments',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Text('All Comments', style: nametxtStyle),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ],
    ),
  );

  Widget userpostdetails(Usercomment userComment) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avatar(userComment.commenterImg, 20),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userComment.commenterName, style: nametxtStyle),
                    const SizedBox(height: 4),
                    Text(userComment.commentContent),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 4),
                child: Row(
                  children: [userComment.commentTime, 'Like', 'Reply']
                      .map(
                        (label) => Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(label, style: smallTxtStyle),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget commentbox() => SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          avatar(widget.userdata.myUserAccount.img, 18),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: commentController,
              focusNode: commentFocus,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => submitComment(),
              decoration: const InputDecoration(
                hintText: 'Write a comment...',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
          ),
          IconButton(
            onPressed: submitComment,
            icon: const Icon(Icons.send, color: Colors.blue),
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final userPost = widget.userPost;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: scrollController,
              children: [
                userline(userPost),
                postimage(userPost),
                buttons(userPost),
                commenters(userPost),
                ...userPost.comments.map(userpostdetails),
              ],
            ),
          ),
          commentbox(),
        ],
      ),
    );
  }
}
