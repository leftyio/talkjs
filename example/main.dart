import 'dart:html';

import 'package:talkjs/talkjs.dart';

Future<void> main() async {
  await addTalkJsScript();
  await TalkJs.ready;
  createInbox();
}

void createInbox() {
  final me = User(
    UserOptions(
      id: '12345',
      name: 'George Looney',
      email: 'george@looney.net',
      photoUrl: 'https://talkjs.com/docs/img/george.jpg',
      welcomeMessage: 'Hey there! How are you? :-)',
    ),
  );

  final talkSession = Session(
    SessionOptions(
      appId: 'tpR92HU',
      me: me,
    ),
  );

  final other = User(
    UserOptions(
      id: '54321',
      name: 'Ronald Raygun',
      email: 'ronald@teflon.com',
      photoUrl: 'https://talkjs.com/docs/img/ronald.jpg',
      welcomeMessage: 'Hey there! Love to chat :-)',
    ),
  );

  final conversationId = TalkJs.oneOnOneId(me, other);
  final conversation = talkSession.getOrCreateConversation(conversationId);

  final inbox = talkSession.createInbox(
    InboxOptions(selected: conversation),
  );

  final el = document.getElementById('talkjs-container');
  if (el == null) return;

  inbox.mount(el);
}
