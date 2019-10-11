@JS()
library talk_js_base;

import 'dart:async';
import 'dart:html';

import 'package:js/js.dart';
import 'package:dart_browser_loader/dart_browser_loader.dart';

import 'talk_js_interop.dart' as interop;

const _talkjsScript = '''
(function(t,a,l,k,j,s){
s=a.createElement('script');s.async=1;s.src="https://cdn.talkjs.com/talk.js";a.getElementsByTagName('head')[0].appendChild(s);k=t.Promise
t.Talk={ready:{then:function(f){if(k)return new k(function(r,e){l.push([f,r,e])});l.push([f])},catch:function(){return k&&new k()},c:l}}
})(window,document,[]);''';

const _scriptId = "talkjs-sdk";

external get undefined;

void addTalkJsScript() {
  loadInlineScript(_talkjsScript, _scriptId);
}

/// A user of your app.
/// This is a vanilla JavaScript object with no behavior.
/// TalkJS uses id to uniquely identify this user.
/// All other fields are allowed to vary over time and the TalkJS database will update its fields accordingly.
class User {
  final interop.TalkJsUser _talkJsUser;

  User._(this._talkJsUser);

  User({
    String id,
    String name,
    String email,
    String photoUrl,
    String welcomeMessage,
    String configuration,
  }) : _talkJsUser = interop.TalkJsUser(interop.TalkJsUserOptions(
            id: id,
            name: name,
            photoUrl: photoUrl,
            welcomeMessage: welcomeMessage,
            configuration: configuration));

  @override
  String toString() => "User{${_talkJsUser.id}, ${_talkJsUser.name}}";
}

/// Encapsulates an active conversation between two parties.
///
/// Use this object to send system messages to the conversation or to programmatically select a conversation by passing it to Inbox.select.
///
/// Don't construct Conversation objects directly.
/// Instead, call [Session.getOrStartConversationId] or [Session.getOrStartConversationWithUser].
class Conversation {
  final interop.TalkJsConversation _talkJsConversation;

  Conversation._(this._talkJsConversation);

  String get id => _talkJsConversation.id;

  String get internalId => _talkJsConversation.internalId;

  List<User> get participants =>
      _talkJsConversation.participants.map((user) => User._(user)).toList();
}

class ConversationData {
  final interop.TalksJSConversationData _talkjsConversationData;

  ConversationData._(this._talkjsConversationData);

  String get id => _talkjsConversationData.id;
}

class ConversationSelectedEvent {
  final interop.TalksJsConversationSelectedEvent
      _talksJsConversationSelectedEvent;

  ConversationSelectedEvent._(this._talksJsConversationSelectedEvent);

  ConversationData get conversation =>
      ConversationData._(_talksJsConversationSelectedEvent.conversation);

  User get me => User._(_talksJsConversationSelectedEvent.me);

  User get other => User._(_talksJsConversationSelectedEvent.other);

  List<User> get others {
    final _others = _talksJsConversationSelectedEvent.others ?? [];
    return _others.map((u) => User._(u)).toList();
  }
}

/// The main messaging UI.
/// Chats on the left, messages on the right.
/// Create an Inbox through [Session.createInbox] and then call [mount] to show it.
class Inbox {
  final interop.TalkJsInbox _talkJsInbox;

  StreamController<ConversationSelectedEvent> _onSelectConversationController;

  Inbox._(this._talkJsInbox) {
    _onSelectConversationController = StreamController(
      onListen: _onListenSelectConversationController,
      onCancel: _onCancelSelectConversationController,
    );
  }

  Stream<ConversationSelectedEvent> get onConversationSelected =>
      _onSelectConversationController.stream;

  /// Renders the UI inside a DOM element specified by [element].
  void mount(Element element) {
    _talkJsInbox.mount(element);
  }

  void destroy() {
    _talkJsInbox.destroy();
    _onSelectConversationController?.close();
  }

  void selectById(String conversationId, [InboxOptions options]) {
    _talkJsInbox.select(conversationId, options._talkJsInboxOptions);
  }

  void _onListenSelectConversationController() {
    _talkJsInbox.on(
        "conversationSelected", allowInterop(_onConversationSelected));
  }

  void _onCancelSelectConversationController() {
    // Commented because 'conversationSelected is an unknown event type
    // _talkJsInbox.off("conversationSelected", allowInterop((_) {}));
  }

  void _onConversationSelected(
      interop.TalksJsConversationSelectedEvent conversationSelectedEvent) {
    _onSelectConversationController
        .add(ConversationSelectedEvent._(conversationSelectedEvent));
  }
}

class Chatbox {
  final interop.TalkJsChatbox _talkJsChatbox;

  Chatbox._(this._talkJsChatbox);

  void mount(Element element) {
    _talkJsChatbox.mount(element);
  }

  void destroy() {
    _talkJsChatbox.destroy();
  }
}

/// A session represents a user's active browser tab. It also authenticates your app with TalkJS.
class Session {
  final interop.TalkJsSession talkJsSession;

  /// Creates a session. Do this once on every page.
  Session(String appId, User me, {String signature})
      : talkJsSession = interop.TalkJsSession(interop.TalkJsSessionOptions(
            appId: appId,
            me: me._talkJsUser,
            signature: signature ?? undefined));

  /// Returns a [Conversation] object that encapsulates a conversation between me (given in the constructor) and other.
  Conversation getOrStartConversationWithUser(User other) {
    return Conversation._(
        talkJsSession.getOrStartConversation(other._talkJsUser));
  }

  /// Returns a [Conversation] object that encapsulates a conversation between me (given in the constructor) and other.
  Conversation getOrStartConversationId(String conversationId) {
    return Conversation._(talkJsSession.getOrStartConversation(conversationId));
  }

  /// The Inbox is the main UI component of TalkJS.
  /// It shows a user's conversation history and it allows them to write messages.
  /// You typically want to call the [mount] method after creating the Inbox to make it visible on your app.
  ///
  /// Call [createInbox] on the messaging page of your app.
  Inbox createInbox({InboxOptions inboxOptions}) {
    inboxOptions ??= InboxOptions();
    return Inbox._(talkJsSession.createInbox(inboxOptions._talkJsInboxOptions));
  }

  Chatbox createChatbox(Conversation converstation) {
    return Chatbox._(
        talkJsSession.createChatbox(converstation._talkJsConversation));
  }

  /// During development you can use a local theme.
  void syncThemeForLocalDev(String path) {
    talkJsSession.syncThemeForLocalDev(path);
  }
}

class TalkJs {
  /// Complete when talkjs is ready
  static Future<void> get ready {
    final completer = Completer<void>();
    interop.ready(allowInterop(completer.complete));
    return completer.future;
  }
}

class InboxOptions {
  interop.TalkJsInboxOptions _talkJsInboxOptions;

  /// Optional.
  /// either a [Conversation] object (as returned from [Session.getOrStartConversationId] or [Session.getOrStartConversationWithUser])
  /// or the id field of a conversation (which you may have stored in your database).
  /// If given, makes the inbox startup up with that conversation selected.
  set selected(dynamic /*Conversation|String*/ newSelected) {
    _talkJsInboxOptions.selected = newSelected;
  }

  /// Create [InboxOptions]
  ///
  /// selected is either a [Conversation] object
  /// (as returned from [Session.getOrStartConversationId] or [Session.getOrStartConversationWithUser])
  /// or the id field of a conversation (which you may have stored in your database).
  /// If given, makes the inbox startup up with that conversation selected.

  InboxOptions({dynamic /*Conversation|String*/ selected}) {
    assert(selected is String || selected is Conversation || selected == null);
    _talkJsInboxOptions = interop.TalkJsInboxOptions();
    if (selected != null) {
      _talkJsInboxOptions.selected = _getSelected(selected);
    }
  }

  _getSelected(selected) {
    if (selected is String) {
      return selected;
    } else if (selected is Conversation) {
      return selected._talkJsConversation;
    } else if (selected == null) {
      return selected;
    }
  }
}
