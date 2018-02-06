import 'dart:html';

import 'package:js/js_util.dart';
import 'package:talkjs/talkjs.dart';

main() async {
  addTalkJsScript();
  await TalkJs.ready;
  print('talk js is ready');

  final me = new User(
      id: "12345",
      name: "George Looney",
      email: "george@looney.net",
      photoUrl: "https://talkjs.com/docs/img/george.jpg",
      welcomeMessage: "Hey there! How are you? :-)");

  final talkSession = new Session("tpR92HU", me);
  setProperty(window, 'talkSession', talkSession.talkJsSession);

  final other = new User(
      id: "54321",
      name: "Ronald Raygun",
      email: "ronald@teflon.com",
      photoUrl: "https://talkjs.com/docs/img/ronald.jpg",
      welcomeMessage: "Hey there! Love to chat :-)");

  final conversation = talkSession.getOrStartConversationWithUser(other);
  final inbox = talkSession.createInbox(
      inboxOptions: new InboxOptions(selected: conversation));
  inbox.mount(document.getElementById("talkjs-container"));
}
