import 'friend.dart';
import 'usercomment.dart';
import 'userpost.dart';
import 'account.dart';

class Userdata {
  List<Userpost> userList = [
    Userpost(
      userimg: 'assets/person1.jfif',
      username: 'John Doe',
      time: '2 hrs ago',
      postcontent: 'Had a great day at the beach!',
      postimg: 'assets/beach.jpg',
      numcomments: '24',
      numshare: '5',
      isLiked: false,
    ),
    Userpost(
      userimg: 'assets/person2.jfif',
      username: 'Jane Smith',
      time: '3 hrs ago',
      postcontent: 'Loving the new cafe in town.',
      postimg: 'assets/pavlova_main.jfif',
      numcomments: '18',
      numshare: '3',
      isLiked: true,
    ),
    Userpost(
      userimg: 'assets/person3.jfif',
      username: 'Mike Johnson',
      time: '5 hrs ago',
      postcontent: 'Just finished a 10k run!',
      postimg: 'assets/run.jpg',
      numcomments: '30',
      numshare: '7',
      isLiked: false,
    ),

    Userpost(
      userimg: 'assets/person4.jfif',
      username: ' Johnson Stewart',
      time: '5 hrs ago',
      postcontent: 'Just finished a 5k run!',
      postimg: 'assets/run1.jpg',
      numcomments: '30',
      numshare: '7',
      isLiked: false,
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/person1.jfif', name: 'Alice'),
    Friend(img: 'assets/person2.jfif', name: 'Bob'),
    Friend(img: 'assets/person3.jfif', name: 'Charlie'),
    Friend(img: 'assets/person4.jfif', name: 'Diana'),
    Friend(img: 'assets/person5.jfif', name: 'Ethan'),
    Friend(img: 'assets/person6.jpg', name: 'Fiona'),
  ];

  List<Usercomment> commentList = [
    Usercomment(
      commenterImg: 'assets/person2.jfif',
      commenterName: 'Jane Smith',
      commentTime: '1 hr ago',
      commentContent: 'Looks fun!',
    ),
    Usercomment(
      commenterImg: 'assets/person3.jfif',
      commenterName: 'Mike Johnson',
      commentTime: '30 mins ago',
      commentContent: 'Wish I was there!',
    ),
    Usercomment(
      commenterImg: 'assets/person4.jfif',
      commenterName: 'Emily Davis',
      commentTime: '15 mins ago',
      commentContent: 'Great photo!',
    ),
  ];

  Account myUserAccount = Account(
    name: 'Zhaira Nicole D. Lestojas',
    email: 'zhaiiahzl11@gmail.com',
    img: 'assets/pfp.jpg',
    numFollowers: '360k',
    numPosts: '350',
    numFollowing: '500',
    numFriends: '400',
  );

  Userdata() {
    for (final post in userList) {
      post.comments.addAll(commentList);
    }
  }
}
