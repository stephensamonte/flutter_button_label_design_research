import 'dart:async';

import 'package:flutter/material.dart';

import 'package:button_label_design_research/Utility/FakeData.dart' as FakeData;
import 'package:button_label_design_research/Utility/MyFBDocuments.dart'
    as MyFBDocuments;

// This is a list of all user events
List<MyFBDocuments.TweetItem> allTweetDataList = new List();

/// Contact Detail Page which displays information on a person.
class TweetListView extends StatefulWidget {
//  static const String routeName = '/contacts';
// here is a state object now defined in MessengerDetailPage
  TweetListView({Key key}) : super(key: key);

//  final DocumentSnapshot personInformationDocument;

  @override
  TweetListViewPageState createState() => new TweetListViewPageState();
}

/// Contact Detail page state.
class TweetListViewPageState extends State<TweetListView> {
  final TextEditingController _textController = new TextEditingController();

  // so search button only works when text field is not empty
  bool _isComposing = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      allTweetDataList = FakeData.allTweets;

      // initialize text controller
      _textController.clear();

      print("test text here: " + _textController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();

//    // remove stream listener
//    documentRef.cancel();

    // remove text controller
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(children: <Widget>[
//        new Container(
//          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
//          // this sets the color of the UserListItem (cards)
//          child: _buildTextComposer(),
//        ),
//        new Divider(height: 1.0), // userListItem Dividers

        new Flexible(
          child: new ListView(
            children: _buildTweetsList(allTweetDataList),
          ),
//          child: (_textController.text != "")
//              ? new ListView(
//                  children: _buildTweetsList(allTweetDataList),
//                )
//              : new TweetList(),
//            new ListView(children: _buildChatsList(),)
        ),
      ]),
    );
  }

  // This is a text input for search textfield
  Widget _buildTextComposer() {
    return new IconTheme(
        // This could just start with the container (icon theme is not necessary)
        data: new IconThemeData(
            color:
                Theme.of(context).accentColor), // This just changes the color.
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                // Prevents using send button when there is no search text typed
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
//                  // show chats that match the search
                  _getEventsMatching(text);
                },
//                // I don't know why I dont pass in a string to "_handlesSubmitted here... but it works
//                onSubmitted: (_isComposing) ? _handleSubmitted : null,

                decoration: new InputDecoration.collapsed(
                    hintText: "Search for an Event"),
//                keyboardType: TextInputType.text,
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.clear),
                  // Prevents using send button when there is no search text typed
//                  onPressed: _isComposing
//                      ? () => _handleSubmitted(_textController.text)
//                      : null),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null),
            ),
          ]),
        ));
  }

  // This handles submitting search item
  Future<Null> _handleSubmitted(String text) async {
    // this clears edit text field
    _textController.clear();

    // Prevents using send button when there is no search text typed
    setState(() {
      _isComposing = false;
    });

    // show only events that match the search
    _getEventsMatching(_textController.text);
  }

// update results and UI to to show what the user searched for
  void _getEventsMatching(String searchInput) {}

  /// Create list of user friends.
  List<_TweetListItem> _buildTweetsList(
      List<MyFBDocuments.TweetItem> eventItemInput) {
    var items = new List<_TweetListItem>();
    for (var eventData in eventItemInput) {
      items.add(new _TweetListItem(eventData));
    }
    return items;
  }
}

/// List of user events
class TweetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        // single event item
        new _TweetListItem(FakeData.fakeEventData2)
      ],
    );
  }
}

/// This is one contact list item.
class _TweetListItem extends StatelessWidget {
  _TweetListItem(this.eventDocument);

  final MyFBDocuments.TweetItem eventDocument;

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.all(2.0),
        child: new ExpansionTile(
            backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
            leading: new Container(
//                margin: const EdgeInsets.only(right: 16.0),
              child: (eventDocument.photoUrl != null)
                  ? new CircleAvatar(
                      backgroundImage: new NetworkImage(eventDocument
                          .photoUrl) // display userphoto from Firebase Database
//                    new NetworkImage(googleSignIn.currentUser.photoUrl) // get google profile photo
                      )
                  : new CircleAvatar(
                      child:
                          new Text(eventDocument.displayName[0])), // old avatar
            ),
            title: new Container(
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new GestureDetector(
                        onTap: () {
                          // Open MessengerDetailPage

                          // Setup information to pass to MessengerDetailPage
                          // this is the chat id of the specific friend
//                          MyVariables.chatInfoItemForDetail = new MyFBDocuments
//                                  .ChatInfoItem.fromUserFriendItem(
//                              UserFriendsDocList[ownerPositionInFriendsList]);
//                          // this is the group name or the recipient name
//                          MyVariables.chatNameForDetail =
//                              UserFriendsDocList[ownerPositionInFriendsList]
//                                  .displayName;
                          // notify MessengerDetailPage.dart if I am opening a group chat or a direct chat
//                          MyVariables.openingGroupMessenger = false;

                          // Navigate to MessengerDetailPage
//                          Navigator.of(context)
//                              .pushNamed("/MessengerDetailPage");
                        },
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(eventDocument.displayName),
                            new Text(eventDocument.text),

                            new Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              child: eventDocument.imageUrl != null
                                  ? // if image Url exist then display image
                              new Image.network(
                                eventDocument.imageUrl,
                                width: 250.0,
                              )
                                  : // This acts like an or statement
                              // Display nothing
                              new Container(
                                child: null,
                              )
                            ),

//                            new NetworkImage("https://pbs.twimg.com/media/DrRePJjXQAAAoyu.jpg")
//                            _buildActions(),
                          ],
                        )),
                  ),
//                  new Container(
//                      child: new IconButton(
//                          icon: (_inviteSent)
//                              ? new Icon(Icons.done)
//                              : new Icon(Icons.send),
//                          onPressed: () {
//
//                            setState(() {
//                              _inviteSent = true;
//                            });
//
//                            // Send invite message to friend
//                            _sendFriendInvite(
//                                context,
//                                ownerPositionInFriendsList,
//                                widget.availableFriendEvent);
//                          })),
                ],
              ),
            ),
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  new Container(
                    // show event note only if there is a note
                    child: (eventDocument.text != "")
                        ? new Container(
//                    padding: const EdgeInsets.fromLTRB(0.0, ),
                            child: new Column(
                            children: <Widget>[
//                              new Text("Note:"),
//                              new Text(eventDocument.note),
                              new Container(
                                child: _buildActions(),
                              )
                            ],
                          ))
                        : null,
                  )
                ],
              ),
            ]));

//    return new FlatButton(
//        onPressed: () {
//          // todo open event TabView view
//
//          // open another
//
////          Navigator.push(
////            context,
////            MaterialPageRoute(builder: (context) =>
////                EventTabView.EventTabView(OpenEventDocument: eventDocument)),
////          );
//        },
//        child: new Container(
//            // could just return container
//            //modified
//            margin: const EdgeInsets.symmetric(vertical: 10.0),
//
//            child: new Row(
//              children: <Widget>[
//                new Expanded(
//                  child: new Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      new Text(eventDocument.displayName),
//                      // Display userListItem from Firebase Database
//                      new Text(eventDocument.note,
//                          style: Theme.of(context).textTheme.subhead),
//                    ],
//                  ),
//                ),
//              ],
//            )
//        )
//    );
  }

  /// Opens a detailed messenger page to the specified chat page.
//  _openDetailedMessengerPage(BuildContext context, String chatID) {
////    new MyMessengerDetailPage.MessengerDetailPage(chatID: chatID, friendName: friendName);
//
////    final FCMNotificationsUtil.Item item = _itemForMessage(chatID);
//
////    item.route.isActive;
//
////    if (!item.route.isCurrent) {
////      Navigator.push(context, item.route);
////    }
//
////    Navigator.push(context, item.route);
//
//    // open new messenger detail page and pass chatID
////    "/MessengerDetailPage": (BuildContext context) => new MessengerDetailPage.MessengerDetailPage(),
////    Navigator.of(context).pushNamed("/MessengerDetailPage");
//
//    // information to pass to MessengerDetailPage
////    MyVariables.chatID = message['chatID'];
//    // this is the group name or the recipient name
////    MyVariables.chatNameSend = message['senderName'];
//    // notify MessengerDetailPage.dart if I am opening a group chat or a direct chat
////    if (message['openedGroupChat'] == "true") {
////      MyVariables.openingGroupMessenger = true;
////    } else {
////      MyVariables.openingGroupMessenger = false;
////    }
//    // open new messenger detail page and pass chatID
////    Navigator
////        .of(context)
////        .pushNamed("/MessengerDetailPage/${MyVariables.chatIDForDetail}");
//  }

//  FCMNotificationsUtil.Item _itemForMessage(chatID) {
////  final String itemId = message['chatID'];
//
//    final FCMNotificationsUtil.Item item = FCMNotificationsUtil.items
//        .putIfAbsent(chatID, () => new FCMNotificationsUtil.Item(itemId: chatID));
////    ..status = message['message'];
//
//    return item;
//  }

// This is a text input for search textfield
  Widget _buildActions() {
    return new Container(
        height: 40.0,
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new FlatButton(
                    onPressed: (){},
                    child: new Container(
                      margin: new EdgeInsets.symmetric(horizontal: 4.0),
                      child: new Text("Like"),
                    )),
                new FlatButton(
                    onPressed: (){},
                    child: new Container(
                      child: new Text("Respect"),
                    )),
                new FlatButton(
                    onPressed: (){},
                    child: new Container(
                      child: new Text("Care"),
                    )),
                new FlatButton(
                    onPressed: (){},
                    child: new Container(
                      child: new Text("Fear"),
                    )),
                new FlatButton(
                    onPressed: (){},
                    child: new Container(
                      child: new Text("Incivil"),
                    )),
              ],
            )
          ],
        ));
//        child: new ListView.builder(
//            scrollDirection: Axis.horizontal,
//            itemBuilder: (BuildContext context, int index) {
//              return new Row(
//                children: <Widget>[
//                  new FlatButton(
//                      onPressed: null,
//                      child: new Container(
//                        margin: new EdgeInsets.symmetric(horizontal: 4.0),
//                        child: new Text("Like"),
//                      )),
//                  new FlatButton(
//                      onPressed: null,
//                      child: new Container(
//                        child: new Text("Respect"),
//                      )),
//                  new FlatButton(
//                      onPressed: null,
//                      child: new Container(
//                        child: new Text("Care"),
//                      )),
//                  new FlatButton(
//                      onPressed: null,
//                      child: new Container(
//                        child: new Text("Fear"),
//                      )),
//                  new FlatButton(
//                      onPressed: null,
//                      child: new Container(
//                        child: new Text("Incivil"),
//                      )),
//                ],
//              );
//            }));
  }
}
