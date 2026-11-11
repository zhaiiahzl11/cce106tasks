import 'account.dart';
import 'usercomment.dart';

class Userpost {
  final String userimg;
  final String username;
  final String time;
  final String postcontent;
  final String postimg;
  String numcomments;
  final String numshare;
  bool isLiked;
  final List<Usercomment> comments;

  Userpost({
    required this.userimg,
    required this.username,
    required this.time,
    required this.postcontent,
    required this.postimg,
    required this.numcomments,
    required this.numshare,
    required this.isLiked,
    List<Usercomment>? comments,
  }) : comments = comments ?? [];

  void addComment(Account account, String text) {
    comments.add(
      Usercomment(
        commenterImg: account.img,
        commenterName: account.name,
        commentTime: 'Just now',
        commentContent: text,
      ),
    );
    numcomments = ((int.tryParse(numcomments) ?? 0) + 1).toString();
  }
}
