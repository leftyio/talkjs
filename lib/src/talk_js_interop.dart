@JS()
library talk_js_interop;

import 'dart:html';
import 'package:js/js.dart';

@JS()
@anonymous
class UserOptions {
  external factory UserOptions({
    String id,
    String name,
    String? email,
    String? photoUrl,
    String? welcomeMessage,
    String? role,
  });
}

@JS('Talk.User')
class User {
  external factory User(UserOptions options);

  external String get id;

  external String get name;

  external String? get email;

  external String? get photoUrl;

  external String? get welcomeMessage;

  external String? role;
}

@JS('Talk.Inbox')
class InboxInterop {
  external void mount(Element element);

  external void destroy();

  external void on(String eventType, Function handler);

  external void off(String eventType, Function handler);

  external void select(
    dynamic /* ConversationBuilder|String*/ conversation, [
    InboxOptions? options,
  ]);
}

@JS('Talk.Chatbox')
class Chatbox {
  external void mount(Element element);

  external void destroy();
}

@JS()
@anonymous
class SessionOptions {
  external factory SessionOptions({
    String appId,
    User me,
    String? signature,
  });
}

@JS()
@anonymous
class ConversationAttributes {
  external factory ConversationAttributes({
    dynamic? custom,
    String? photoUrl,
    String? subject,
    List<String>? welcomeMessages,
  });
}

@JS()
@anonymous
class ParticipantSettings {
  external factory ParticipantSettings({
    String? access,
    bool? notify,
  });
}

@JS('Talk.ConversationBuilder')
class ConversationBuilder {
  external dynamic? get custom;
  external String? get photoUrl;
  external String? get subject;
  external List<String>? get welcomeMessages;

  external void setAttributes(ConversationAttributes attributes);
  external void setParticipant(
    User user,
    ParticipantSettings settings,
  );
}

@JS('Talk.Session')
class Session {
  external factory Session(SessionOptions options);

  external String get appId;

  external User get me;

  external ConversationBuilder getOrCreateConversation(String id);

  external InboxInterop createInbox(InboxOptions inboxOptions);

  external Chatbox createChatbox(ConversationBuilder conversation);

  external void syncThemeForLocalDev(String path);
}

@JS()
@anonymous
class InboxOptions {
  external dynamic /*ConversationBuilder|String*/ get selected;

  external set selected(dynamic /*ConversationBuilder|String*/ selected);

  external factory InboxOptions({
    dynamic /*ConversationBuilder|String*/ selected,
  });
}

@JS()
@anonymous
class ConversationData {
  external String get id;

  external String? get photoUrl;

  external String? get subject;

  external List<String>? get welcomeMessages;

  external factory ConversationData({
    String id,
    String? photoUrl,
    String? subject,
    List<String>? welcomeMessages,
  });
}

@JS()
@anonymous
class ConversationSelectedEvent {
  external ConversationData? get conversation;
  external User get me;
  external List<User>? get others;

  external factory ConversationSelectedEvent({
    ConversationData? conversation,
    User me,
    List<User>? others,
  });
}
