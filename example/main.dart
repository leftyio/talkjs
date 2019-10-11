import 'dart:html';

import 'package:talkjs/talkjs.dart';

main() {
  TalkJs.ready.then((_) => createInbox());

  addTalkJsScript();
}

void createInbox() {
  final me = User(
    id: "12345",
    name: "George Looney",
    email: "george@looney.net",
    photoUrl: "https://talkjs.com/docs/img/george.jpg",
    welcomeMessage: "Hey there! How are you? :-)",
  );

  final talkSession = Session("tpR92HU", me);

  final other = User(
    id: "54321",
    name: "Ronald Raygun",
    email: "ronald@teflon.com",
    photoUrl: "https://talkjs.com/docs/img/ronald.jpg",
    welcomeMessage: "Hey there! Love to chat :-)",
  );

  final conversation = talkSession.getOrStartConversationWithUser(other);

  final inbox = talkSession.createInbox(
    inboxOptions: InboxOptions(selected: conversation),
  );

  inbox.mount(document.getElementById("talkjs-container"));
}
