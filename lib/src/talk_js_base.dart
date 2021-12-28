@JS()
library talk_js_base;

import 'dart:async';
import 'dart:html';
import 'dart:js' as js;

import 'package:js/js.dart';

import 'interop.dart' as interop;

const _talkjsScript = '''
(function(t,a,l,k,j,s){
s=a.createElement('script');s.async=1;s.src="https://cdn.talkjs.com/talk.js";a.head.appendChild(s)
;k=t.Promise;t.Talk={v:3,ready:{then:function(f){if(k)return new k(function(r,e){l.push([f,r,e])});l
.push([f])},catch:function(){return k&&new k()},c:l}};})(window,document,[]);
''';

external dynamic get undefined;

void addTalkJsScript() {
  js.context.callMethod('eval', [_talkjsScript]);
}

/// The main messaging UI.
/// Chats on the left, messages on the right.
/// Create an Inbox through [Session.createInbox] and then call [mount] to show it.
class TalkJsInbox {
  final interop.Inbox _talkJsInbox;

  late StreamController<interop.ConversationSelectedEvent>
      _onSelectConversationController;

  TalkJsInbox(this._talkJsInbox) {
    _onSelectConversationController = StreamController(
      onListen: _onListenSelectConversationController,
      onCancel: _onCancelSelectConversationController,
    );
  }

  Stream<interop.ConversationSelectedEvent> get onConversationSelected =>
      _onSelectConversationController.stream;

  /// Renders the UI inside a DOM element specified by [element].
  Future<void> mount(Element? element) {
    return promiseToFuture(_talkJsInbox.mount(element));
  }

  void on(String eventType, Function handler) {
    _talkJsInbox.on(eventType, allowInterop(handler));
  }

  void off(String eventType, Function handler) {
    _talkJsInbox.off(eventType, allowInterop(handler));
  }

  void destroy() {
    _talkJsInbox.destroy();
    _onSelectConversationController.close();
  }

  void selectById(String conversationId) {
    _talkJsInbox.select(conversationId);
  }

  void _onListenSelectConversationController() {
    on('conversationSelected', _onConversationSelected);
  }

  void _onCancelSelectConversationController() {
    // Commented because 'conversationSelected is an unknown event type
    // _talkJsInbox.off("conversationSelected", allowInterop((_) {}));
  }

  void _onConversationSelected(
    interop.ConversationSelectedEvent event,
  ) {
    _onSelectConversationController.add(event);
  }
}

class TalkJs {
  /// Complete when talkjs is ready
  static Future<void> get ready {
    return promiseToFuture(interop.ready);
  }

  ///
  /// NOTE: If this function changes make sure to update the documentation in `The_Talk_Object.md`
  ///
  /// A helper method to predictably compute a Conversation ID based on participants' ids in the given conversation.
  /// Use this method if you want to simply create a conversation between two users,
  /// not related to a particular product, order or transaction.
  ///
  /// The order of the parameters does not matter.
  /// For example, `Talk.oneOnOneId("a", "b")` yields the same result as `Talk.oneOnOneId("b", "a")`.
  ///
  /// This method takes the following steps:
  /// 1. Take two ids of users and put them in an array
  /// 2. Sort them lexicographically
  /// 3. JSON encode them
  /// 4. hash the result using SHA1, return the first 20 characters
  ///
  /// In pseudocode, this is what this function does:
  ///
  ///     var sorted = [me.id, other.id].sort()
  ///     var encoded = JSON.encode(sorted)
  ///     var hash = sha1(encoded)
  ///     return truncate(hash, 20)
  ///
  /// For a PHP implementation, see https://gist.github.com/eteeselink/4dc3ad32cc478986ff2b5b6361a1825f.
  /// {@link https://talkjs.com/?chat | Get in touch} if you need our help implementing this in your backend language.
  /// @public
  static String oneOnOneId(
    dynamic /*User|String*/ me,
    dynamic /*User|String*/ other,
  ) {
    return interop.oneOnOneId(me, other);
  }

  /// Retrieves global App metadata.
  ///
  /// @remarks This function may be called before instantiating a Talk.Session, and
  /// is not authenticated. Please consider all app metadata (eg global custom
  /// fields) to be public data, and ensure that you do not store any sensitive
  /// data in app custom fields.
  ///
  /// You can change App metadata using the TalkJS REST API.
  ///
  /// Note that this function cannot be used to verify whether an app ID exists; it
  /// always returns valid data, even for nonexistent app IDs.
  static Future<interop.AppMetadata> getAppMetadata(String appId) {
    return promiseToFuture(interop.getAppMetadata(appId));
  }
}
