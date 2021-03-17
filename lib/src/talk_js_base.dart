@JS()
library talk_js_base;

import 'dart:async';
import 'dart:html';

import 'package:js/js.dart';
import 'package:dart_browser_loader/dart_browser_loader.dart';

import 'talk_js_interop.dart';

const _talkjsScript = '''
(function(t,a,l,k,j,s){
s=a.createElement('script');s.async=1;s.src="https://cdn.talkjs.com/talk.js";a.head.appendChild(s)
;k=t.Promise;t.Talk={v:3,ready:{then:function(f){if(k)return new k(function(r,e){l.push([f,r,e])});l
.push([f])},catch:function(){return k&&new k()},c:l}};})(window,document,[]);
''';

const _scriptId = 'talkjs-sdk';

external dynamic get undefined;

Future<void> addTalkJsScript() async {
  await loadInlineScript(_talkjsScript, _scriptId);
}

/// The main messaging UI.
/// Chats on the left, messages on the right.
/// Create an Inbox through [Session.createInbox] and then call [mount] to show it.
class Inbox {
  final InboxInterop _talkJsInbox;

  late StreamController<ConversationSelectedEvent>
      _onSelectConversationController;

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
    _onSelectConversationController.close();
  }

  void selectById(String conversationId, [InboxOptions? options]) {
    _talkJsInbox.select(conversationId, options);
  }

  void _onListenSelectConversationController() {
    _talkJsInbox.on(
      'conversationSelected',
      allowInterop(_onConversationSelected),
    );
  }

  void _onCancelSelectConversationController() {
    // Commented because 'conversationSelected is an unknown event type
    // _talkJsInbox.off("conversationSelected", allowInterop((_) {}));
  }

  void _onConversationSelected(
    ConversationSelectedEvent event,
  ) {
    _onSelectConversationController.add(event);
  }
}

@JS('Talk.ready.then')
external void _ready(Function f);

@JS('Talk.oneOnOneId')
external String _oneOnOneId(
  dynamic /*User|String*/ me,
  dynamic /*User|String*/ other,
);

class TalkJs {
  /// Complete when talkjs is ready
  static Future<void> get ready {
    final completer = Completer<void>();
    _ready(allowInterop(completer.complete));
    return completer.future;
  }

  static String oneOnOneId(
    dynamic /*User|String*/ me,
    dynamic /*User|String*/ other,
  ) =>
      _oneOnOneId(me, other);
}
