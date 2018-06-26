@JS()
library talk_js_interop;

import 'dart:html';
import 'package:js/js.dart';

@JS()
@anonymous
class TalkJsUserOptions {
  external factory TalkJsUserOptions(
      {String id,
      String name,
      String photoUrl,
      String welcomeMessage,
      String configuration});
}

@JS('Talk.User')
class TalkJsUser {
  external factory TalkJsUser(TalkJsUserOptions options);

  external String get id;

  external String get name;

  external String get email;

  external String get photoUrl;

  external String get welcomeMessage;

  external String get configuration;
}

@JS('Talk.Conversation')
class TalkJsConversation {
  external String get id;

  external String get internalId;

  external List<TalkJsUser> get participants;
}

@JS('Talk.Inbox')
class TalkJsInbox {
  external void mount(Element element);

  external void destroy();
}

@JS('Talk.Chatbox')
class TalkJsChatbox {
  external void mount(Element element);

  external void destroy();
}

@JS()
@anonymous
class TalkJsSessionOptions {
  external factory TalkJsSessionOptions(
      {String appId, TalkJsUser me, String signature});
}

@JS('Talk.Session')
class TalkJsSession {
  external factory TalkJsSession(TalkJsSessionOptions options);

  external String get appId;

  external TalkJsUser get me;

  external String get signature;

  external TalkJsConversation getOrStartConversation(
      dynamic /*_TalJsUser|String*/ other);

  external TalkJsInbox createInbox(TalkJsInboxOptions inboxOptions);

  external TalkJsChatbox createChatbox(TalkJsConversation conversation);

  external void syncThemeForLocalDev(String path);
}

@JS('Talk.ready.then')
external void ready(Function f);

@JS()
@anonymous
class TalkJsInboxOptions {
  external dynamic /*TalkJsConversation|String*/ get selected;

  external void set selected(dynamic /*TalkJsConversation|String*/ selected);

  external factory TalkJsInboxOptions(
      {dynamic /*TalkJsConversation|String*/ selected});
}
