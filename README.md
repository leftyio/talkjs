# TalkJs

Javascript interop for [TalkJs](https://talkjs.com)

See TalkJs [documentations](https://talkjs.com/docs/Getting_Started/index.html) documentations more infos

## Example

```dart
import 'dart:html';

import 'package:talkjs/talkjs.dart';

Future<void> main() async {
  addTalkJsScript();
  await TalkJs.ready;
  createInbox();
}

void createInbox() {
  final me = User(
    UserOptions()
      ..id = '12345'
      ..name = 'George Looney'
      ..email = 'george@looney.net'
      ..photoUrl = 'https://talkjs.com/docs/img/george.jpg'
      ..welcomeMessage = 'Hey there! How are you? :-)',
  );

  final talkSession = Session(
    SessionOptions()
      ..appId = '<APP_ID>'
      ..me = me,
  );

  final other = User(
    UserOptions()
      ..id = '54321'
      ..name = 'Ronald Raygun'
      ..email = 'ronald@teflon.com'
      ..photoUrl = 'https://talkjs.com/docs/img/ronald.jpg'
      ..welcomeMessage = 'Hey there! Love to chat :-)',
  );

  final conversationId = TalkJs.oneOnOneId(me, other);
  final conversation = talkSession.getOrCreateConversation(conversationId);
  conversation.setParticipant(me);
  conversation.setParticipant(other);

  final inbox = TalkJsInbox(
    talkSession.createInbox(
      InboxOptions()..selected = conversation,
    ),
  );

  final el = document.getElementById('talkjs-container');
  if (el == null) return;

  inbox.mount(el);
}
```