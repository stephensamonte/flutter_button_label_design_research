import 'package:button_label_design_research/Utility/MyFBDocuments.dart'
    as MyFBDocuments;

MyFBDocuments.UserPersonItem friendWithConflict =
    new MyFBDocuments.UserPersonItem(
  displayName: "James Bond",
  email: "bond@james.com",
  photoUrl:
      "https://i2.wp.com/beebom.com/wp-content/uploads/2016/01/Reverse-Image-Search-Engines-Apps-And-Its-Uses-2016.jpg?w=640&ssl=1",
  timestampCreated:  new DateTime.utc(2018, DateTime.november, 9),
  timestampModified:  new DateTime.utc(2018, DateTime.november, 9),
  uid: "unique id",
);

MyFBDocuments.TweetItem fakeEventData1 = new MyFBDocuments.TweetItem(
    displayName: "Fox News",
    photoUrl: "https://pbs.twimg.com/profile_images/918480715158716419/4X8oCbge_400x400.jpg",
    imageUrl: "https://pbs.twimg.com/media/DrRePJjXQAAAoyu.jpg",
    text: "U.S. service members assigned to @dodpaa participated in a disinterment "
        "ceremony Monday at the National Memorial Cemetery of the Pacific in "
        "Honolulu. The ceremony was part of DPAA’s efforts to disinter the "
        "remains of unknown service members lost during the Korean War.",
    timecreated:  new DateTime.utc(2018, DateTime.november, 9),
    lastModified: new DateTime.utc(2018, DateTime.november, 9),
    owner: "owner uid",
    documentID: "Unique Document ID");

MyFBDocuments.TweetItem fakeEventData2 = new MyFBDocuments.TweetItem(
    displayName: "Donald J. Trump",
    photoUrl: "https://pbs.twimg.com/profile_images/874276197357596672/kUuht00m_400x400.jpg",
    imageUrl: null,
    text: "Just landed in Fort Wayne, Indiana for a #MAGARally at the Allen County War Memorial Coliseum. See everyone soon!",
    timecreated: new DateTime.utc(2018, DateTime.november, 9, 1),
    lastModified: new DateTime.utc(2018, DateTime.november, 9, 2),
    owner: "owner uid",
    documentID: "Unique Document ID");

MyFBDocuments.TweetItem fakeEventData3 = new MyFBDocuments.TweetItem(
    displayName: "CNN",
    photoUrl: "https://pbs.twimg.com/profile_images/508960761826131968/LnvhR8ED_400x400.png",
    imageUrl: "https://pbs.twimg.com/media/DrRhX1QXQAENLFK.jpg:large",
    text: "A famous painting that sold for 1.6M made its first public "
        "appearance in decades at an exhibition in Nigeria. Ben Enwonwu\'s "
        "\"Tutu,\" often dubbed the \"African Mona Lisa,\" was missing for more "
        "than 40 years before turning up in a London apartment last year https://cnn.it/2Qn3ls2 ",
    timecreated: new DateTime.utc(2018, DateTime.november, 9, 2),
    lastModified: new DateTime.utc(2018, DateTime.november, 9, 5),
    owner: "owner uid",
    documentID: "Unique Document ID");

MyFBDocuments.TweetItem fakeEventData4 = new MyFBDocuments.TweetItem(
    displayName: "diaplyName Goes here",
    photoUrl: "https://i2.wp.com/beebom.com/wp-content/uploads/2016/01/Reverse-Image-Search-Engines-Apps-And-Its-Uses-2016.jpg?w=640&ssl=1",
    imageUrl: null,
    text: "This is a random tweet.",
    timecreated: new DateTime.utc(2018, DateTime.november, 9, 3),
    lastModified: new DateTime.utc(2018, DateTime.november, 6),
    owner: "owner uid",
    documentID: "Unique Document ID");


List<MyFBDocuments.TweetItem> allTweets = [fakeEventData1, fakeEventData2, fakeEventData3, fakeEventData4];