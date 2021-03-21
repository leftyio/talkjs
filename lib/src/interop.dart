@JS('Talk')
library talk_js_interop;

import 'dart:html';

import 'package:js/js.dart';

/// App metadata, such as global custom fields for the entire app.
@JS()
@anonymous
class AppMetadata {
  external factory AppMetadata();

  external String id;
  external dynamic custom;
}

@JS()
@anonymous
class UserData {
  external factory UserData();

  /// The unqiue ID which is used to identify the user in TalkJS
  external dynamic /*String|number*/ id;

  /// The User's name which will be displayed on the TalkJS UI
  external String name;

  /// An optional URL to a photo which will be displayed as the user's avatar
  external String? photoUrl;

  /// The default message a user sees when starting a chat with that person
  external String? welcomeMessage;

  /// TalkJS supports multiple sets of settings, called "roles". These allow you to change the behavior of TalkJS for different users.
  /// You have full control over which user gets which configuration.
  external String? role;

  /// Allows you to set custom metadata for the User
  external dynamic custom;

  /// Availability acts similarly to {@link User.welcomeMessage} but appears as a {@link https://talkjs.com/docs/Reference/Concepts/System_Messages.html | system message}.
  external String? availabilityText;

  /// The locale field expects an {@link https://www.w3.org/International/articles/language-tags/ | IETF language tag}.
  /// See the {@link https://talkjs.com/docs/Features/Multiple_Languages.html | localization documentation}.
  external String? locale;
}

@JS()
@anonymous
class UserOptions {
  external factory UserOptions();

  ///The unqiue ID which is used to identify the user in TalkJS
  external dynamic /*String|num*/ id;

  /// The User's name which will be displayed on the TalkJS UI
  external String name;

  /// One or more email address belonging to the User. The email addresses will be used for {@link https://talkjs.com/docs/Features/Notifications/Email_Notifications/index.html | Email Notifications}
  /// if they are enabled.
  external dynamic /*String|List<String>|Null*/ email;

  /// One or more phone numbers belonging to the User. The phone number will be used for {@link https://talkjs.com/docs/Features/Notifications/SMS_Notifications.html | SMS Notifications }
  /// (this feature requires standard plan and up).
  external dynamic /*String|List<String>|Null*/ phone;

  /// An optional URL to a photo which will be displayed as the user's avatar
  external String? photoUrl;

  /// The default message a user sees when starting a chat with that person
  external String? welcomeMessage;

  /// TalkJS supports multiple sets of settings, called "roles". These allow you to change the behavior of TalkJS for different users.
  /// You have full control over which user gets which configuration.
  external String? role;

  /// Allows you to set custom metadata for the User
  external dynamic custom;

  /// Availability acts similarly to {@link User.welcomeMessage} but appears as a {@link https://talkjs.com/docs/Reference/Concepts/System_Messages.html | system message}.
  external String? availabilityText;

  /// The locale field expects an {@link https://www.w3.org/International/articles/language-tags/ | IETF language tag}.
  /// See the {@link https://talkjs.com/docs/Features/Multiple_Languages.html | localization documentation}.
  external String? locale;
}

/// A user of your app. TalkJS uses the `id` to uniquely identify this user.
/// All other fields of a User are allowed to vary over time and the TalkJS database will update its fields accordingly.
/// @public
@JS()
class User {
  /// The unqiue ID which is used to identify the user in TalkJS
  external String get id;

  /// The User's name which will be displayed on the TalkJS UI
  external String get name;

  /// One or more email address belonging to the User. The email addresses will be used for {@link https://talkjs.com/docs/Features/Notifications/Email_Notifications/index.html | Email Notifications}
  /// if they are enabled.
  external dynamic /*String|List<String>|Null*/ get email;

  /// One or more phone numbers belonging to the User. The phone number will be used for {@link https://talkjs.com/docs/Features/Notifications/SMS_Notifications.html | SMS Notifications }
  /// (this feature requires standard plan and up).
  external dynamic /*String|List<String>|Null*/ get phone;

  /// An optional URL to a photo which will be displayed as the user's avatar
  external String? get photoUrl;

  /// The default message a user sees when starting a chat with that person
  external String? get welcomeMessage;

  /// TalkJS supports multiple sets of settings, called "roles". These allow you to change the behavior of TalkJS for different users.
  /// You have full control over which user gets which configuration.
  external String? get role;

  /// Allows you to set custom metadata for the User
  external dynamic get custom;

  /// Availability acts similarly to {@link User.welcomeMessage} but appears as a {@link https://talkjs.com/docs/Reference/Concepts/System_Messages.html | system message}.
  external String? get availabilityText;

  /// The locale field expects an {@link https://www.w3.org/International/articles/language-tags/ | IETF language tag}.
  /// See the {@link https://talkjs.com/docs/Features/Multiple_Languages.html | localization documentation}.
  external String? get locale;

  /// Create a TalkJS User
  ///
  /// @remarks
  /// Use this constructor to synchronize user data with the TalkJS backend.
  ///
  /// The fields `id`, `name` and `email` are required.
  /// A warning will be emitted if `role` is not specified.
  ///
  /// Set `email` to `null` if you want to use TalkJS without email fallback.
  external factory User(UserOptions options);
}

/// Specifies access and notification settings for a given user's participation
/// to a given conversation. Used in {@link ConversationBuilder.setParticipant}.
/// @public
@JS()
@anonymous
class ParticipationSettings {
  external factory ParticipationSettings();

  /// Specifies the participant's access permission for a conversation. See {@link ConversationBuilder.setParticipant}
  /// "Read" | "ReadWrite"
  external String? access;

  /// Specifies the participants's notification settings. See {@link ConversationBuilder.setParticipant}
  external bool? notify;
}

/// Conversation attributes that can be set using {@link ConversationBuilder.setAttributes}
/// @public
@JS()
@anonymous
class ConversationAttributes {
  external factory ConversationAttributes();

  /// A human-readable subject of the conversation. Supports formatted links in a Markdown-style syntax, e.g.
  /// `Beautiful <https://example.com/booking/18644|home by the sea>!`.
  ///  URLs and email addresses are made clickable, and emojis made to work cross-platform.
  external String? subject;

  /// The URL of a photo to be used for this conversation in the TalkJS UI in case there are more than 2 participants
  /// (TalkJS shows the photo of the other participant in a 1-on-1 conversation)
  external String? photoUrl;

  /// Custom metadata that is stored with the conversation
  external dynamic custom;

  /// Messages which are sent at the beginning of a chat.
  /// In this case the messages will appear as system messages.
  external dynamic /*List<String>|String*/ welcomeMessages;
}

/// Allows you to filter conversations down to a specific subset.
///
/// Use with {@link Inbox.setFeedFilter} or pass {@link InboxOptions.feedFilter} to {@link Session.createInbox}.
@JS()
@anonymous
class ConversationPredicate {
  external factory ConversationPredicate();

  /// Only select conversations that the current user as specific access to.
  ///
  /// Must be an 2-element array of `[operator, operand]` structure. Valid operators are:
  /// `"=="`, `"!="`, `"oneOf"`, and `"!oneOf"`.
  ///
  /// The operand must be either a string (one of `"ReadWrite"`, `"Read"` or `"None"`) or an array of strings (for the `oneOf` operators).
  ///
  /// Example:
  /// ```js
  /// // to remove conversations that the user has no access to anymore, do:
  /// { access: ["!=", "None"] }
  /// ```
  external dynamic access;

  /// Only select conversations that have particular custom fields set to particular values.
  ///
  /// @remarks
  /// Every key must correspond to a key in the custom conversation data that you set (by passing
  /// `custom` to {@link ConversationBuilder.setAttributes}). It is not necessary for all
  /// conversations to have these keys.
  ///
  /// Each value must be one of the following:
  ///
  /// A string, equal to `"exists"` or `"!exists"`
  ///
  /// A 2-element array of `[operator, operand]` structure.  The operand must be either a
  /// string or an array of strings (for the `oneOf` operators). Valid operators are:
  /// `"=="`, `"!="`, `"oneOf"`, and `"!oneOf"`.
  ///
  /// Examples, assuming you have set a `category` custom field on your conversations:
  ///
  /// ```js
  /// // only show conversations that have no category set:
  /// { custom: { category: "!exists" } }
  ///
  /// // only show conversations of category "shoes"
  /// { custom: { category: ["==", "shoes"] } }
  ///
  /// // only show conversations either category "shoes" or "sandals"
  /// { custom: { category: ["oneOf", ["shoes", "sandals"] ] } }
  ///
  /// // only show conversations about shoes that are marked visible.
  /// // this assumes you also have a custom field called `visibility`
  /// { custom: { category: ["==", "shoes"], visibility: ["==", "visible" ] } }
  /// ```
  external dynamic custom;

  /// Set this field to only select conversations that have, or don't have any, unread messages.
  external bool? hasUnreadMessages;
}

/// Encapsulates the message entry field tied to the currently selected conversation.
@JS()
@anonymous
class MessageField {
  external factory MessageField();

  /// Focuses the message entry field. Note that on mobile devices, this will cause the on-screen
  /// keyboard to pop up, obscuring part of the screen.
  external void focus();

  /// Sets the message entry field to `text`.
  ///
  /// Useful if you want to guide your user with message suggestions. If you want to start a UI
  /// with a given text showing immediately, call this method before calling {@link Inbox.mount}
  ///
  /// @param text - The text to be displayed in the message entry field
  external void setText(String text);

  /// Sets the visibility of the Message Field to a given value or to a certain predicate.
  ///
  /// See {@link MessageFieldOptions.visible} for examples.
  ///
  /// @param visible - boolean or a more advanced predicate.
  external void setVisible(dynamic /*boolean | ConversationPredicate*/ visible);
}

/// A message that was sent to TalkJS
@JS()
@anonymous
class SentMessage {
  external factory SentMessage();

  /// The message ID of the message that was sent
  external String? id;

  /// The ID of the conversation that the message belongs to
  external String conversationId;

  /// Identifies the message as either a {@link https://talkjs.com/docs/Reference/Concepts/Messages.html | User message} or
  /// {@link https://talkjs.com/docs/Reference/Concepts/System_Messages.html | System message}
  /// "UserMessage" | "SystemMessage"
  external String type;

  /// Contains an Array of {@link User.id}'s that have read the message
  external List<String> readBy;

  /// Contains the user ID for the person that sent the message
  external String senderId;

  /// Contains the message's text
  external String? text;

  /// Only given if the message contains a file. An object with the URL and filesize (in bytes) of the given file.
  /// {
  ///   url: string;
  ///   size: number;
  /// }
  external dynamic attachment;

  /// Only given if the message contains a location. An array of two numbers which represent the longitude and latitude of this location, respectively. Only given if this message is a shared location.
  ///
  /// Example:
  ///
  /// ```js
  /// [51.481083, -3.178306]
  /// ```
  external List<num>? location;
}

@JS()
@anonymous
class ConversationData {
  external factory ConversationData();

  /// The ID of the conversation
  external String id;

  /// Contains custom metadata for the conversation if it was set using {@link ConversationBuilder.custom}.
  external dynamic custom;

  /// Contains the conversation subject if it was set using {@link ConversationBuilder.subject}.
  external String? subject;

  /// @deprecated
  /// Please use {@link ConversationBuilder.subject} instead.
  external String? topicId;

  /// Contains the URL of a photo was set using {@link ConversationBuilder.subject}.
  external String? photoUrl;

  /// One or more welcome messages that will display to the user as a SystemMessage
  external List<String>? welcomeMessages;
}

/// This event is triggered when the user toggles real-time message translation using the built-in toggle.
@JS()
@anonymous
class TranslationToggledEvent {
  external factory TranslationToggledEvent();

  /// Boolean indicating if translation is enabled or not
  external bool isEnabled;

  /// Conversation for which translation has been toggled
  external ConversationData conversation;
}

/// @public
/// The event triggered when listening for the sendMessage event on the {@link Inbox}, {@link Chatbox} and {@link Popup}.
/// This event is triggered before the message is sent to TalkJS, allowing you to modify the contents of the message or its metadata by
/// using `override()`.
@JS()
@anonymous
class SendMessageEvent {
  external factory SendMessageEvent();

  /// The message that was sent
  external SentMessage message;

  /// The current TalkJS user
  external UserData me;

  /// The current conversation object
  external ConversationData conversation;

  external void override(dynamic /*{ text, custom }*/);
}

@JS()
@anonymous
class SendMessageOptions {
  external factory SendMessageOptions();

  /// An object with any custom data that you may wish to associate with this message. The custom data is sent back to you via webhooks and the REST API.
  external dynamic custom;
}

@JS()
@anonymous
class HtmlPanelOptions {
  external factory HtmlPanelOptions();

  /// Required. URL you want to load inside the HTML panel.
  /// Url can be absolute ("https://www.example.com/register-form.html") or relative ("register-form.html").
  /// We recommend using same origin pages to have better control of the page.
  /// Learn more about HTML Panels and same origin pages {@link https://talkjs.com/docs/Customizations/HTML_Panels.html | here}.
  external String url;

  /// Optional, defaults to 300 (px).
  external num? height;

  /// Optional, defaults to true. Set false if you don't want the HTML panel to be shown after
  /// `createHtmlPanel` is called. You can change the visibility of the HTML panels by
  /// calling `.hide()` or `.show()` on the `HtmlPanel` instance returned by `createHtmlPanel`'s promise.
  external bool? show;

  /// Either a `Conversation` object
  /// (as returned from `getOrCreateConversation`) or the `id` field of
  /// a conversation (which you may have stored in your database).
  /// If given the HTML panel called will only show up for that conversation.
  external dynamic /*ConversationBuilder | string | Null*/ conversation;
}

/// HTML Panel
/// HTML panels should only be created through {@link Inbox.createHtmlPanel}, {@link Chatbox.createHtmlPanel} or {@link Popup.createHtmlPanel}.
@JS()
@anonymous
class HtmlPanel {
  external factory HtmlPanel();

  /// Shows the panel if it's hidden.
  external void show();

  /// Hides the panel if it's visible.
  external void hide();

  /// Changes the panel height.
  ///
  /// @remarks
  /// If you don't need to change the height after the panel is created, you can pass it as an option to the `createHtmlPanel`.
  external void setHeight(num height);

  /// Returns `true` if the panel is visible, `false` if it's hidden or destroyed
  external bool isVisible();

  /// Destroys the HTML panel
  external dynamic /* *Promise*/ destroy();
}

/// Lets you show only specific messages in the chat panel of a Chatbox, Inbox or Popup.
@JS()
@anonymous
class MessagePredicate {
  external factory MessagePredicate();

  /// Only show messages that are sent by a sender that has all of the given properties
  ///
  /// For example:
  ///
  /// ```js
  /// // Only show messages sent by users with the role of 'admin' and if the user ID is 1.
  /// {sender: {role: ["==", "admin"], id: ["==", "1"]}}
  /// ```
  external dynamic sender;

  /// Only show messages of a given type, for example:
  ///
  /// ```js
  /// {type: ["==", "SystemMessage"]}
  /// ```
  ///
  external dynamic type;

  /// Only show messages that were sent by users (web), through the REST API (rest), via
  /// reply-to-email (email) or via the import REST API (import).
  ///
  /// For example:
  ///
  /// ```js
  /// // Don't show messages that were sent via the REST API
  /// { origin: ["!=", "rest"] }
  /// ```
  ///
  external dynamic origin;

  /// Only select messages that have particular custom fields set to particular values.
  ///
  /// @remarks
  /// Every key must correspond to a key in the custom message data that you have set. It is not necessary for all
  /// messages to have these keys.
  ///
  /// Each value must be one of the following:
  ///
  /// A string, equal to `"exists"` or `"!exists"`
  ///
  /// A 2-element array of `[operator, operand]` structure.  The operand must be either a
  /// string or an array of strings (for the `oneOf` operators). Valid operators are:
  /// `"=="`, `"!="`, `"oneOf"`, and `"!oneOf"`.
  ///
  /// Examples, assuming you have set a `category` custom field on your messages:
  ///
  /// ```js
  /// // Only show messages that have no category set:
  /// { custom: { category: "!exists" } }
  ///
  /// // Only show messages of that have the category "shoes"
  /// { custom: { category: ["==", "shoes"] } }
  ///
  /// // Only show messages that have the 'topic' either "inquiry" or "reservation"
  /// { custom: { topic: ["oneOf", ["inquiry", "reservation"] ] } }
  ///
  /// // Only show messages about shoes that are marked visible.
  /// // this assumes you also have a custom field called `visibility`
  /// { custom: { category: ["==", "shoes"], visibility: ["==", "visible" ] } }
  /// ```
  external dynamic custom;
}

@JS()
@anonymous
class UIBox {
  external factory UIBox();

  /// Switches the active conversation the conversation.
  ///
  /// @remarks
  /// `conversation` can be either a {@link ConversationBuilder} object or a TalkJS
  /// conversation id. Passing `null` means that the conversation will be de-selected in the UI and the message list will disappear.
  /// Passing `undefined` means that the last conversation (or "no chats yet" page if there are no other conversations) will be rendered in the message list component.
  external void select(/* string |  ConversationBuilder | null*/ conversation);

  /// Encapsulates the message entry field tied to the currently selected conversation.
  external MessageField messageField;

  external void on(String eventType, Function handler);

  external void off(String eventType, Function handler);

  /// HTML Panels allow you to place a HTML document in an iframe in your chats, just above the entry box.
  ///
  /// @remarks
  /// Using HTML Panels, you can extend TalkJS UIs to have anything from credit card payments to lead collection forms, or, for instance,
  /// to show the product details of a marketplace transaction between your users.
  /// See our {@link https://talkjs.com/docs/Features/Customizations/HTML_Panels.html | HTMLPanels documentation} for more info
  ///
  external dynamic /* Promise<HtmlPanel>*/ createHtmlPanel(
    HtmlPanelOptions options,
  );

  /// Sets metadata for the current session.
  ///
  /// @param visible - Manually sets the information about the visibility of TalkJS.
  /// This is useful when TalkJS is hidden with CSS. TalkJS will assume that UIs
  /// marked `visible: false` cannot be seen, and thus messages arriving on this UI will
  /// not be marked as read until you set `visible` to true again.
  ///
  /// @param custom - Additional parameter to store the custom fields, that you
  /// may want to use in the REST API call.
  external void setPresence(dynamic val);

  /// Destroys an inbox and removes all event listeners it has running. Call this before removing the inbox
  /// container from the DOM.
  external void destroy();

  /// Please use {@link Session.setDesktopNotificationEnabled} instead.
  ///
  /// @remarks
  /// This method will keep being supported, but for new projects,
  /// we recommend that you use {@link Session.setDesktopNotificationEnabled}.
  ///
  /// Sets desktop notification on or off. Has the same effect as toggling the
  /// "Desktop notification" toggle in the TalkJS Inbox UI. Use this function to replicate that
  /// toggle elsewhere in your UI if you're using TalkJS in a mode that doesn't show this toggle.
  ///
  /// @deprecated
  external void toggleDesktopNotifications(bool isEnabled);

  /// Used to control which messages are shown in the message list, depending on a type, origin
  /// or custom message attributes.
  ///
  /// See {@link MessagePredicate} for all available options.
  external void setMessageFilter(MessagePredicate filter);

  /// Enable or disable translation for a conversation.
  ///
  ///  @param conversation - The conversation for which this hsould be be set. If not specified, the setting will be applied to the currently selected conversation.
  ///  @param enabled - Whether translation should be enabled
  external void setTranslationEnabledForConversation(
    dynamic /*string | ConversationBuilder*/ conversation,
    bool enabled,
  );

  /// Enable/disable translation by default. This setting is applied to any conversation for which you haven't set a specific value.
  /// @param enabled - Whether conversations should be translated by default or not. Pass "auto" to enable translation for conversations
  /// with users with different locales.
  external void setTranslationEnabledDefault(
    dynamic /*boolean | "auto"*/ enabled,
  );

  /// The TalkJS search feature includes the ability to highlight certain words in messages. Call
  /// this method to highlight certain words without having the user invoke the search feature.
  /// Call again with an empty array to disable highlighting.
  ///
  /// Note: like the search feature, this option only works in TalkJS Premium and up.
  ///
  /// Also see {@link ChatboxOptions.highlightedWords}
  external void setHighlightedWords(List<String> words);
}

/// A messaging UI for just a single conversation
///
/// There is no way for the user to switch between conversations
/// (but you can change the active conversation through {@link Chatbox.select}).
/// Create a Chatbox through {@link Session.createChatbox} and then call
/// {@link Chatbox.mount} to show it.
/// @public
@JS()
@anonymous
class Chatbox {
  external factory Chatbox();

  /// Switches the active conversation the conversation.
  ///
  /// @remarks
  /// `conversation` can be either a {@link ConversationBuilder} object or a TalkJS
  /// conversation id. Passing `null` means that the conversation will be de-selected in the UI and the message list will disappear.
  /// Passing `undefined` means that the last conversation (or "no chats yet" page if there are no other conversations) will be rendered in the message list component.
  external void select(/* string |  ConversationBuilder | null*/ conversation);

  /// Encapsulates the message entry field tied to the currently selected conversation.
  external MessageField messageField;

  external void on(String eventType, Function handler);

  external void off(String eventType, Function handler);

  /// HTML Panels allow you to place a HTML document in an iframe in your chats, just above the entry box.
  ///
  /// @remarks
  /// Using HTML Panels, you can extend TalkJS UIs to have anything from credit card payments to lead collection forms, or, for instance,
  /// to show the product details of a marketplace transaction between your users.
  /// See our {@link https://talkjs.com/docs/Features/Customizations/HTML_Panels.html | HTMLPanels documentation} for more info
  ///
  external dynamic /* Promise<HtmlPanel>*/ createHtmlPanel(
    HtmlPanelOptions options,
  );

  /// Sets metadata for the current session.
  ///
  /// @param visible - Manually sets the information about the visibility of TalkJS.
  /// This is useful when TalkJS is hidden with CSS. TalkJS will assume that UIs
  /// marked `visible: false` cannot be seen, and thus messages arriving on this UI will
  /// not be marked as read until you set `visible` to true again.
  ///
  /// @param custom - Additional parameter to store the custom fields, that you
  /// may want to use in the REST API call.
  external void setPresence(dynamic val);

  /// Destroys an inbox and removes all event listeners it has running. Call this before removing the inbox
  /// container from the DOM.
  external void destroy();

  /// Please use {@link Session.setDesktopNotificationEnabled} instead.
  ///
  /// @remarks
  /// This method will keep being supported, but for new projects,
  /// we recommend that you use {@link Session.setDesktopNotificationEnabled}.
  ///
  /// Sets desktop notification on or off. Has the same effect as toggling the
  /// "Desktop notification" toggle in the TalkJS Inbox UI. Use this function to replicate that
  /// toggle elsewhere in your UI if you're using TalkJS in a mode that doesn't show this toggle.
  ///
  /// @deprecated
  external void toggleDesktopNotifications(bool isEnabled);

  /// Used to control which messages are shown in the message list, depending on a type, origin
  /// or custom message attributes.
  ///
  /// See {@link MessagePredicate} for all available options.
  external void setMessageFilter(MessagePredicate filter);

  /// Enable or disable translation for a conversation.
  ///
  ///  @param conversation - The conversation for which this hsould be be set. If not specified, the setting will be applied to the currently selected conversation.
  ///  @param enabled - Whether translation should be enabled
  external void setTranslationEnabledForConversation(
    dynamic /*string | ConversationBuilder*/ conversation,
    bool enabled,
  );

  /// Enable/disable translation by default. This setting is applied to any conversation for which you haven't set a specific value.
  /// @param enabled - Whether conversations should be translated by default or not. Pass "auto" to enable translation for conversations
  /// with users with different locales.
  external void setTranslationEnabledDefault(
    dynamic /*boolean | "auto"*/ enabled,
  );

  /// The TalkJS search feature includes the ability to highlight certain words in messages. Call
  /// this method to highlight certain words without having the user invoke the search feature.
  /// Call again with an empty array to disable highlighting.
  ///
  /// Note: like the search feature, this option only works in TalkJS Premium and up.
  ///
  /// Also see {@link ChatboxOptions.highlightedWords}
  external void setHighlightedWords(List<String> words);

  /// Renders the UI inside a DOM element specified by `container`.
  ///
  /// @remarks
  /// `container` must either be a DOM Element (as returned by e.g. `document.getElementById`) or
  /// a JQuery object with a single element.
  external dynamic /*Promise<void>*/ mount(HtmlElement? container);
}

@JS()
@anonymous
class ChatboxOptions {
  external factory ChatboxOptions();

  /// Controls the text direction (for supporting right-to-left languages such as Arabic and Hebrew). TalkJS tries
  /// to determine the appropriate text direction from the parent page, but if that does not work or you want to
  /// explicitly control it, you can override it here. Defaults to "rtl".
  /// "rtl" | "ltr"
  external String? dir;

  /// Sets the message input box to the given text.
  /// You can use this to suggest a certain initial message to be sent. The user can still edit it before hitting "send".
  ///
  /// @deprecated We recommend using {@link MessageField.setText} before mounting the chatbox to precisely control when message suggestions are shown.
  external String? messageSuggestion;

  /// Used to control if the Chat Header is displayed in the UI. Defaults to true.
  external bool? showChatHeader;

  /// Controls what text appears in the chat title, in the header above the messages.
  /// Defaults to `"participants"`.
  ///
  /// (also see {@link this.chatSubtitleMode} and {@link InboxOptions.feedConversationTitleMode})
  /// "subject" | "participants"
  external String? chatTitleMode;

  /// Controls what text appears in the chat subtitle, right below the chat title.
  /// No subtitle is displayed when the conversation has no subject set or when set to `null`.
  /// Defaults to `"subject"`.
  ///
  /// (also see {@link this.chatTitleMode} and {@link InboxOptions.feedConversationTitleMode})
  /// "subject" | "participants"
  external String? chatSubtitleMode;

  /// TalkJS leverages `iframe`s behind the scenes and therefore not all services that you use in your app will work out of the box.
  /// This option adds support for a number of services to help you use them. Let us know if you're missing any.
  external ThirdPartyOptions thirdparties;

  /// Used to control which messages are shown in the message list, depending on a type, origin
  /// or custom message attributes.
  ///
  /// See {@link MessagePredicate} for all available options.
  ///
  /// You can also modify the filter on the fly using {@link UIBox.setMessageFilter}.
  external MessagePredicate? messageFilter;

  /// TalkJS can translate conversations to the current user's locale using Google Translate.
  /// This option specifies which conversations should be translated in this UI. You can pass a boolean to enable/disable
  /// translation for all conversations, "auto" to enable translation on conversations where users have different locales,
  /// or you can pass an array of {@link ConversationBuilder}s or conversation Ids to be translated.
  /// This feature is only available on the Premium plan and above. Make sure you add your Google Translate API key in the dashboard.

  external dynamic /*bool | "auto" | List<String> | List<ConversationBuilder>*/ translateConversations;

  /// Set this to `true` to show a translation toggle in all conversations.
  /// Set this to `"auto"` to show a translation toggle in conversations where there are participants with different locales.
  /// This setting defaults to `false`, meaning that no toggles will be shown.
  /// In order to use this, you must be on the Premium plan, and set a Google Translate API key in the dashboard.
  external dynamic /*bool | "auto" | null */ showTranslationToggle;

  /// Settings that affect the behavior of the message field
  external MessageFieldOptions? messageField;
}

/// A Conversation Builder represents a conversation that is about to be created, fetched, or updated.
/// You can use this object to set up or modify a conversation before showing it.
///
/// Note: any changes you make here will not be sent to TalkJS immediately.
/// Instead, instantiate a TalkJS UI using methods such as {@link Session.createInbox}.
///
@JS()
@anonymous
class ConversationBuilder {
  external factory ConversationBuilder();

  /// An optional conversation subject which will be displayed in the chat header.
  external String? subject;

  /// Allows custom conversation metadata to be stored in the form `{ [name: string]: string }`
  external dynamic custom;

  /// An optional URL to a photo which will be shown as the photo for the conversation.
  external String? photoUrl;

  /// Messages which are sent at the beginning of a chat.
  /// In this case the messages will appear as system messages.
  external List<String>? welcomeMessages;

  /// Sets a participant of the conversation.
  ///
  /// @remarks
  /// This method is idempotent and can be called multiple times.
  ///
  /// @param user - A `User` object that identifies the person who is a participant of the
  /// conversation. The user is uniquely identified by their id; all other fields (name, photo etc)
  /// are overwritten in the TalkJS database each  time they change.
  /// @param settings - An optional setting of participation, can be an initial `access` right or
  /// if user should be notified.
  external void setParticipant(User user, [dynamic settings]);

  /// Used to set certain attributes for a specific conversation
  ///
  /// @remarks
  /// For example:
  ///
  /// ```
  /// conversation.setAttributes({subject: "Booking question"});
  /// conversation.setAttributes({custom:
  ///   {
  ///     sold: "true",
  ///     itemId: "720"
  ///   }
  /// });
  ///
  /// ```
  ///
  external void setAttributes(ConversationAttributes attributes);

  /// Sends a text message in a given conversation.
  /// @param text - The message body that is to be sent.
  external dynamic /*Promise<void>*/ sendMessage(
    String text,
    SendMessageOptions options,
  );
}

/// This represents the interface of the event triggered from {@link Inbox.on | Inbox.on("conversationSelected")}.
@JS()
@anonymous
class ConversationSelectedEvent {
  external factory ConversationSelectedEvent();

  /// The current TalkJS {@link User}
  external UserData me;

  /// The other participants in the conversation that are not the current user
  external List<UserData>? others;

  /// The current conversation object
  external ConversationData? conversation;
}

/// This event is triggered when {@link https://talkjs.com/docs/Features/Notifications/Browser_Notifications.htm | desktop notifications} are toggled.
@JS()
@anonymous
class DesktopNotificationToggledEvent {
  /// Boolean indicating if desktop Notifications are enabled or not
  external bool isEnabled;
}

@JS()
@anonymous
class FullStoryOptions {
  external factory FullStoryOptions();

  /// Fullstory hostname
  external String? host;

  /// Fullstory organization ID
  external String org;
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
@JS()
external dynamic /*Promise<AppMetadata>*/ getAppMetadata(String appId);

@JS()
@anonymous
class GetOrStartOptionsA {
  external factory GetOrStartOptionsA();

  external String? topicId;

  /// Only used if `topicId` is given: a human-readable subject
  /// of the conversation. Supports formatted links in a Markdown-style syntax, e.g.
  /// `Beautiful <https://yoursite.com/booking/18644|home by the sea>!`.
  /// URLs and email addresses are made clickable, and emojis made to work
  /// cross-platform.
  external String? subject;

  /// Additional parameter to store the custom fields, that you
  /// want to use in the email template. E.g. `custom.specialToken`
  external dynamic custom;

  /// Photo to be used for this conversation in the TalkJS UI. */
  external String? photoUrl;

  external List<String>? welcomeMessages;
}

@JS()
@anonymous
class GetOrStartOptionsB {
  external factory GetOrStartOptionsB();

  external List<User> participants;

  /// Only used if `topicId` is given: a human-readable subject
  /// of the conversation. Supports formatted links in a Markdown-style syntax, e.g.
  /// `Beautiful <https://yoursite.com/booking/18644|home by the sea>!`.
  /// URLs and email addresses are made clickable, and emojis made to work
  /// cross-platform.
  external String? subject;

  /// Additional parameter to store the custom fields, that you
  /// want to use in the email template. E.g. `custom.specialToken`
  external dynamic custom;

  /// Photo to be used for this conversation in the TalkJS UI. */
  external String? photoUrl;
}

/// The main messaging UI. Chats on the left, messages on the right.
/// Create an Inbox through {@link Session.createInbox} and then call {@link Inbox.mount} to show it.
/// @public
@JS()
@anonymous
class Inbox {
  external factory Inbox();

  /// Switches the active conversation the conversation.
  ///
  /// @remarks
  /// `conversation` can be either a {@link ConversationBuilder} object or a TalkJS
  /// conversation id. Passing `null` means that the conversation will be de-selected in the UI and the message list will disappear.
  /// Passing `undefined` means that the last conversation (or "no chats yet" page if there are no other conversations) will be rendered in the message list component.
  external void select(/* string |  ConversationBuilder | null*/ conversation);

  /// Encapsulates the message entry field tied to the currently selected conversation.
  external MessageField messageField;

  external void on(String eventType, Function handler);

  external void off(String eventType, Function handler);

  /// HTML Panels allow you to place a HTML document in an iframe in your chats, just above the entry box.
  ///
  /// @remarks
  /// Using HTML Panels, you can extend TalkJS UIs to have anything from credit card payments to lead collection forms, or, for instance,
  /// to show the product details of a marketplace transaction between your users.
  /// See our {@link https://talkjs.com/docs/Features/Customizations/HTML_Panels.html | HTMLPanels documentation} for more info
  ///
  external dynamic /* Promise<HtmlPanel>*/ createHtmlPanel(
    HtmlPanelOptions options,
  );

  /// Sets metadata for the current session.
  ///
  /// @param visible - Manually sets the information about the visibility of TalkJS.
  /// This is useful when TalkJS is hidden with CSS. TalkJS will assume that UIs
  /// marked `visible: false` cannot be seen, and thus messages arriving on this UI will
  /// not be marked as read until you set `visible` to true again.
  ///
  /// @param custom - Additional parameter to store the custom fields, that you
  /// may want to use in the REST API call.
  external void setPresence(dynamic val);

  /// Destroys an inbox and removes all event listeners it has running. Call this before removing the inbox
  /// container from the DOM.
  external void destroy();

  /// Please use {@link Session.setDesktopNotificationEnabled} instead.
  ///
  /// @remarks
  /// This method will keep being supported, but for new projects,
  /// we recommend that you use {@link Session.setDesktopNotificationEnabled}.
  ///
  /// Sets desktop notification on or off. Has the same effect as toggling the
  /// "Desktop notification" toggle in the TalkJS Inbox UI. Use this function to replicate that
  /// toggle elsewhere in your UI if you're using TalkJS in a mode that doesn't show this toggle.
  ///
  /// @deprecated
  external void toggleDesktopNotifications(bool isEnabled);

  /// Used to control which messages are shown in the message list, depending on a type, origin
  /// or custom message attributes.
  ///
  /// See {@link MessagePredicate} for all available options.
  external void setMessageFilter(MessagePredicate filter);

  /// Enable or disable translation for a conversation.
  ///
  ///  @param conversation - The conversation for which this hsould be be set. If not specified, the setting will be applied to the currently selected conversation.
  ///  @param enabled - Whether translation should be enabled
  external void setTranslationEnabledForConversation(
    dynamic /*string | ConversationBuilder*/ conversation,
    bool enabled,
  );

  /// Enable/disable translation by default. This setting is applied to any conversation for which you haven't set a specific value.
  /// @param enabled - Whether conversations should be translated by default or not. Pass "auto" to enable translation for conversations
  /// with users with different locales.
  external void setTranslationEnabledDefault(
    dynamic /*boolean | "auto"*/ enabled,
  );

  /// The TalkJS search feature includes the ability to highlight certain words in messages. Call
  /// this method to highlight certain words without having the user invoke the search feature.
  /// Call again with an empty array to disable highlighting.
  ///
  /// Note: like the search feature, this option only works in TalkJS Premium and up.
  ///
  /// Also see {@link ChatboxOptions.highlightedWords}
  external void setHighlightedWords(List<String> words);

  /// Used to control which conversations are shown in the conversation feed, depending on access
  /// level, custom conversation attributes or message read status.
  ///
  /// See {@link ConversationPredicate} for all available options.
  ///
  /// You can also set the filter in {@link Session.createInbox} using {@link InboxOptions.feedFilter}.
  external void setFeedFilter(ConversationPredicate filter);

  /// Renders the UI inside a DOM element specified by `container`. `container`
  /// must either be a DOM Element (as returned by e.g. `document.getElementById`) or
  /// a JQuery object with a single element.
  external dynamic /*Promise<void>*/ mount(Element? container);
}

@JS()
@anonymous
class InboxOptions {
  /// Controls the text direction (for supporting right-to-left languages such as Arabic and Hebrew). TalkJS tries
  /// to determine the appropriate text direction from the parent page, but if that does not work or you want to
  /// explicitly control it, you can override it here. Defaults to "rtl".
  /// "rtl" | "ltr"
  external String? dir;

  /// Sets the message input box to the given text.
  /// You can use this to suggest a certain initial message to be sent. The user can still edit it before hitting "send".
  ///
  /// @deprecated We recommend using {@link MessageField.setText} before mounting the chatbox to precisely control when message suggestions are shown.
  external String? messageSuggestion;

  /// Used to control if the Chat Header is displayed in the UI. Defaults to true.
  external bool? showChatHeader;

  /// Controls what text appears in the chat title, in the header above the messages.
  /// Defaults to `"participants"`.
  ///
  /// (also see {@link this.chatSubtitleMode} and {@link InboxOptions.feedConversationTitleMode})
  /// "subject" | "participants"
  external String? chatTitleMode;

  /// Controls what text appears in the chat subtitle, right below the chat title.
  /// No subtitle is displayed when the conversation has no subject set or when set to `null`.
  /// Defaults to `"subject"`.
  ///
  /// (also see {@link this.chatTitleMode} and {@link InboxOptions.feedConversationTitleMode})
  /// "subject" | "participants"
  external String? chatSubtitleMode;

  /// TalkJS leverages `iframe`s behind the scenes and therefore not all services that you use in your app will work out of the box.
  /// This option adds support for a number of services to help you use them. Let us know if you're missing any.
  external ThirdPartyOptions thirdparties;

  /// Used to control which messages are shown in the message list, depending on a type, origin
  /// or custom message attributes.
  ///
  /// See {@link MessagePredicate} for all available options.
  ///
  /// You can also modify the filter on the fly using {@link UIBox.setMessageFilter}.
  external MessagePredicate? messageFilter;

  /// TalkJS can translate conversations to the current user's locale using Google Translate.
  /// This option specifies which conversations should be translated in this UI. You can pass a boolean to enable/disable
  /// translation for all conversations, "auto" to enable translation on conversations where users have different locales,
  /// or you can pass an array of {@link ConversationBuilder}s or conversation Ids to be translated.
  /// This feature is only available on the Premium plan and above. Make sure you add your Google Translate API key in the dashboard.

  external dynamic /*bool | "auto" | List<String> | List<ConversationBuilder>*/ translateConversations;

  /// Set this to `true` to show a translation toggle in all conversations.
  /// Set this to `"auto"` to show a translation toggle in conversations where there are participants with different locales.
  /// This setting defaults to `false`, meaning that no toggles will be shown.
  /// In order to use this, you must be on the Premium plan, and set a Google Translate API key in the dashboard.
  external dynamic /*bool | "auto" | null */ showTranslationToggle;

  /// Settings that affect the behavior of the message field
  external MessageFieldOptions? messageField;

  ///  Makes the inbox start up with the given Conversation. Can be passed a value of the type ConversationBuilder (returned by getOrCreateConversation) or the string value of the conversation id. Conversation can be deselected on startup by passing a null value. Passing undefined means that the last conversation (or "no chats yet page") will be displayed.
  external dynamic selected;

  /// Controls if the feed header containing the toggle to enable desktop notifications is shown.
  /// Defaults to true.
  external bool? showFeedHeader;

  /// Controls how a chat is displayed in the feed of chats.
  ///
  /// Note: when set to `"subject"` but a conversation has no subject set, then
  /// TalkJS falls back to `"participants"`.
  ///
  /// When not set, defaults to `"auto"`, which means that in group conversations
  /// that have a subject set, the subject is displayed and otherwise the participants.
  ///
  /// (also see {@link this.chatSubtitleMode} and {@link this.chatTitleMode})
  /// "participants" | "subject" | "auto"
  external String? feedConversationTitleMode;

  /// Controls whether the user navigating between conversation should count
  /// as steps in the browser history. Defaults to true, which means that if the user
  /// clicks the browser's back button, they go back to the previous conversation
  /// (if any).
  external bool? useBrowserHistory;

  /// Used to control which conversations are shown in the conversation feed, depending on access
  /// level, custom conversation attributes or message read status.
  ///
  /// See {@link ConversationPredicate} for all available options.
  ///
  /// You can also modify the filter on the fly using {@link Inbox.setFeedFilter}.
  external ConversationPredicate feedFilter;

  /// Whether to show a "Back" button at the top of the chat screen on mobile devices.
  external bool? showMobileBackButton;
}

/// A TalkJS message, used as part of {@link Session.on}
@JS()
@anonymous
class Message {
  external factory Message();

  /// Contains the {@link ConversationData} that the message belongs to.
  external ConversationData conversation;

  /// 'true' if the message was sent by the current user.
  external bool isByMe;

  /// The senderID (userID) for the person that sent the message
  external String? senderId;

  /// The {@link User} that sent the message
  external UserData? sender;

  /// Contains the message's content
  external String body;

  /// Specifies if if the message is media (file), text or a shared location
  /// "media" | "text" | "location"
  external String type;

  /// UNIX timestamp specifying when the message was sent (UTC, in milliseconds)
  external num timestamp;

  /// 'true' if the message has been read, 'false' has not been seen yet
  external bool read;

  /// Determines how this message was sent: respectively, Via a web browser (or mobile Webview), via the REST API, via reply-to-email, or using the import API.
  external String origin;

  /// Custom metadata that is stored with the conversation
  external dynamic custom;

  /// Only given if the message's `type` equals `"media"`. An object with the URL and filesize (in bytes) of the given file.
  external dynamic attachment;

  /// Only given if the message's `type` equals `"location"`. An array of two numbers which represent the longitude and latitude of this location, respectively. Only given if this message is a shared location.
  ///
  /// Example:
  ///
  /// ```js
  /// [51.481083, -3.178306]
  /// ```
  external List<num>? location;
}

@JS()
@anonymous
class MessageFieldOptions {
  external factory MessageFieldOptions();

  /// If set to `true`, pressing the enter key sends the message (if there is text in the message
  /// field). When set to `false`, the only way to send a message is by clicking or touching the
  /// "Send" button. Defaults to `true`.
  external bool? enterSendsMessage;

  /// Specifies whether the
  /// {@link https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea#attr-spellcheck | spellcheck}
  /// attribute is set on the message field. Note that setting this to `true` may also enable
  /// autocorrect on some mobile devices. Defaults to `false`.
  external bool? spellcheck;

  /// Overrides the "placeholder" in the message field, which displays a dimmed text when no text has yet been entered.
  ///
  /// Defaults to "Say something..." (or a {@link https://talkjs.com/docs/Features/Multiple_Languages.html | translation thereof}).
  external String? placeholder;

  /// Determines whether the message field is visible. Pass either a boolean (`false` to hide it),
  /// or a {@link ConversationPredicate}. The latter approach lets you show/hide the message field
  /// based on properties of the current conversation.
  ///
  /// For example, to hide the message field when the current user has no write access to the
  /// current conversation, do the following:
  ///
  /// ```js
  /// // this predicate holds iff the current user's `access` to the current conversation is
  /// // set to "ReadWrite"`:
  /// const showMessageField = { access: ["==", "ReadWrite"] };
  /// session.createInbox(conversation, { messageField: { visible: showMessageField } });
  /// ```
  ///
  /// Defaults to `true`.
  external dynamic /*bool|ConversationPredicate*/ visible;
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
@JS()
external String oneOnOneId(
  dynamic /*User | string*/ me,
  dynamic /*User | string*/ other,
);

/// Contains information about an individual participant
@JS()
@anonymous
class Participant {
  external factory Participant();

  /// A Talk JS {@link User}
  external User get readonly;

  /// Contains access and notification settings for a given user's participation to a given conversation. Used in ConversationBuilder.setParticipant.
  external dynamic get participationSettings;
}

/// A messaging UI for just a single conversation.
///
/// There is no way for the user to switch between conversations
/// (but you can change the active conversation through {@link Popup.select}).
/// Create a Popup through {@link Session.createPopup} and then call
/// {@link Popup.mount} to show it.
@JS()
@anonymous
class Popup {
  external factory Popup();

  /// Switches the active conversation the conversation.
  ///
  /// @remarks
  /// `conversation` can be either a {@link ConversationBuilder} object or a TalkJS
  /// conversation id. Passing `null` means that the conversation will be de-selected in the UI and the message list will disappear.
  /// Passing `undefined` means that the last conversation (or "no chats yet" page if there are no other conversations) will be rendered in the message list component.
  external void select(/* string |  ConversationBuilder | null*/ conversation);

  /// Encapsulates the message entry field tied to the currently selected conversation.
  external MessageField messageField;

  external void on(String eventType, Function handler);

  external void off(String eventType, Function handler);

  /// HTML Panels allow you to place a HTML document in an iframe in your chats, just above the entry box.
  ///
  /// @remarks
  /// Using HTML Panels, you can extend TalkJS UIs to have anything from credit card payments to lead collection forms, or, for instance,
  /// to show the product details of a marketplace transaction between your users.
  /// See our {@link https://talkjs.com/docs/Features/Customizations/HTML_Panels.html | HTMLPanels documentation} for more info
  ///
  external dynamic /* Promise<HtmlPanel>*/ createHtmlPanel(
    HtmlPanelOptions options,
  );

  /// Sets metadata for the current session.
  ///
  /// @param visible - Manually sets the information about the visibility of TalkJS.
  /// This is useful when TalkJS is hidden with CSS. TalkJS will assume that UIs
  /// marked `visible: false` cannot be seen, and thus messages arriving on this UI will
  /// not be marked as read until you set `visible` to true again.
  ///
  /// @param custom - Additional parameter to store the custom fields, that you
  /// may want to use in the REST API call.
  external void setPresence(dynamic val);

  /// Destroys an inbox and removes all event listeners it has running. Call this before removing the inbox
  /// container from the DOM.
  external void destroy();

  /// Please use {@link Session.setDesktopNotificationEnabled} instead.
  ///
  /// @remarks
  /// This method will keep being supported, but for new projects,
  /// we recommend that you use {@link Session.setDesktopNotificationEnabled}.
  ///
  /// Sets desktop notification on or off. Has the same effect as toggling the
  /// "Desktop notification" toggle in the TalkJS Inbox UI. Use this function to replicate that
  /// toggle elsewhere in your UI if you're using TalkJS in a mode that doesn't show this toggle.
  ///
  /// @deprecated
  external void toggleDesktopNotifications(bool isEnabled);

  /// Used to control which messages are shown in the message list, depending on a type, origin
  /// or custom message attributes.
  ///
  /// See {@link MessagePredicate} for all available options.
  external void setMessageFilter(MessagePredicate filter);

  /// Enable or disable translation for a conversation.
  ///
  ///  @param conversation - The conversation for which this hsould be be set. If not specified, the setting will be applied to the currently selected conversation.
  ///  @param enabled - Whether translation should be enabled
  external void setTranslationEnabledForConversation(
    dynamic /*string | ConversationBuilder*/ conversation,
    bool enabled,
  );

  /// Enable/disable translation by default. This setting is applied to any conversation for which you haven't set a specific value.
  /// @param enabled - Whether conversations should be translated by default or not. Pass "auto" to enable translation for conversations
  /// with users with different locales.
  external void setTranslationEnabledDefault(
    dynamic /*boolean | "auto"*/ enabled,
  );

  /// The TalkJS search feature includes the ability to highlight certain words in messages. Call
  /// this method to highlight certain words without having the user invoke the search feature.
  /// Call again with an empty array to disable highlighting.
  ///
  /// Note: like the search feature, this option only works in TalkJS Premium and up.
  ///
  /// Also see {@link ChatboxOptions.highlightedWords}
  external void setHighlightedWords(List<String> words);

  /// Mounts the Popup to the parent container
  ///
  external dynamic /*Promise<void>*/ mount(HtmlElement? container);

  /// Shows the Popup, previously hidden or mounted with a parameter `show: false`
  external void show();

  /// Closes the Popup, but doesn't remove it from the DOM
  external void hide();
}

/// A session represents a user's active browser tab. It also authenticates your app
/// with TalkJS.
///
@JS()
class Session {
  // private readonly _eventEmitter;
  // private _uiBoxes;
  // private _alive;

  /// Holds information about unread conversations. Lets your app be notified
  /// when the active user receives a new message.
  external Unreads get readonly;

  /// The TalkJS {@link User} associated with the current user in your application. */
  external User get me;

  /// Your TalkJS `AppId` that can be found your TalkJS {@link https://talkjs.com/dashboard | dashboard}. */
  external String get appId;

  //private readonly _sessionId;

  /// Creates a TalkJS Session.
  external Session(SessionOptions options);

  /// Verifies whether the `appId` is valid.
  ///
  /// @remarks
  /// Returns a Promise of a boolean, never rejects.
  external dynamic /*Promise<boolean>*/ hasValidCredentials();

  // private _maybeRestorePopup;
  // private _trackWindowFocus;
  // private _maybeAddMyParticipant;

  /// A method used to either fetch or create a conversation.
  ///
  /// @remarks
  /// Returns a `ConversationBuilder` object that encapsulates a conversation
  /// between `me` (given in the constructor) and zero or more other `participants`.
  /// Use {@link ConversationBuilder.setParticipant} and {@link ConversationBuilder.setAttributes}
  /// on the returned object to further set up your conversation.
  ///
  /// @param conversationId - A unique identifier for this conversation, such as a channel name or topic ID.
  /// Any user with access to this ID can join this conversation. {@link https://talkjs.com/docs/Reference/Concepts/Conversations.html | Read about how to choose a good conversation ID for your use case}.
  /// If you want to make a simple one-on-one conversation, consider using {@link oneOnOneId} to generate one.
  external ConversationBuilder getOrCreateConversation(String conversationId);

  /// Creates an Inbox UI
  ///
  /// @remarks
  /// The Inbox is the main UI component of TalkJS. It shows a user's conversation
  /// history and it allows them to write messages. You typically want to call the
  /// `mount` method after creating the Inbox to make it visible on your app.
  ///
  /// Call `createInbox` on the messaging page of your app.
  ///
  /// @param options - Optional. Use these to finetune the behavior of the Inbox.
  external Inbox createInbox(InboxOptions? options);

  /// Creates a Chatbox UI
  ///
  /// @remarks
  /// The Chatbox is a slimmer version of the Inbox. It shows a single conversation,
  /// without means to switch between conversations. You typically want to call the
  /// `mount` method after creating the Chabox to make it visible on your app.
  ///
  /// Call `createChatbox` on any page you want to show a chatbox of a single conversation.
  ///
  /// Passing `null` for `selectedConversation` parameter will initialize TalkJS upon
  /// mounting, but will *not* display a UI yet. You need to call `chatbox.select(conversation)`
  /// in order to render the UI with a conversation. This is useful for preloading the
  /// chatbox in some situations.
  ///
  /// When you call `createChatbox()` with `undefined` or without a parameter, it is going to render the user's latest active conversation in the UI upon mounting.
  ///
  /// @param selectedConversation - Select the conversation to show in the UI.
  /// @param options - Optional. Use these to finetune the behavior of the Chatbox.
  external Chatbox createChatbox(
      ConversationBuilder? selectedConversation, ChatboxOptions? options);

  /// Creates a Popup UI
  ///
  /// @remarks
  /// The Popup is a beautiful, well positioned box containing a conversation. It shows a single conversation,
  /// without means to switch between conversations. In order to have a popup on each site you need to call
  /// `createPopup` on any page you want to show a popup with the conversation.
  ///
  /// Passing `null` for `selectedConversation` parameter will initialize TalkJS upon
  /// mounting, but will *not* display a UI yet. You need to call `Popup.select(conversation)`
  /// in order to render the UI with a conversation. This is useful for preloading the
  /// Popup in some situations.
  ///
  /// If you call `createPopup()` without a parameter, or when passing undefined, it is going to render the latest conversation in the UI upon mounting.
  /// @param conversation - The conversation to show on the UI.
  external Popup createPopup(
      ConversationBuilder? conversation, PopupOptions? options);

  /// Used to configure TalkJS to use a theme hosted on the same location as your application for development.
  ///
  /// @remarks
  /// Tells TalkJS to use a theme hosted on the same location as your application (e.g. localhost:8000/).
  /// e.g. Call `talkSession.syncThemeForLocalDev("/assets/css/talkjs-theme.css")`
  /// just before you call `createInbox` or `createChatbox`. TalkJS will then use the specified file instead of using a theme created in the dashboard.
  ///
  /// @param path - The path to the theme's CSS file
  external void syncThemeForLocalDev(String path);

  /// Sets desktop notification on or off.
  ///
  /// @remarks
  /// Has the same effect as toggling the "Desktop notification" toggle in the TalkJS Inbox UI. Use
  /// this function to replicate that toggle elsewhere in your UI if you're using TalkJS in a mode
  /// that doesn't show this toggle.
  ///
  /// @param isEnabled - Whether notifications should be enabled.
  /// @param alertOnFailure - Whether to show an alert message when enabling notifications fails.
  ///
  /// @returns a promise that'll resolve if the change succeeds, but rejects if anything goes
  /// wrong. If anything goes wrong, the promise will be rejected with a {@link TalkError}, which has a
  /// `code` property. Possible values for it are:
  ///
  /// - `Talk.ErrorCode.NOTIFICATIONS_PERMISSION_DENIED`: The browser or the user didn't grant you
  ///   permission to send notifications.
  ///
  /// - `Talk.ErrorCode.NOTIFICATIONS_NOT_SUPPORTED`: The browser doesn't support desktop
  ///   notifications.
  external dynamic /*Promise<void>*/ setDesktopNotificationEnabled(
      bool isEnabled, dynamic options);

  // private _cleanUIBoxes;

  /// Registers mobile device, one user can be connected to one mobile device.
  ///
  /// @remarks
  /// Related method: {@link Session.unregisterDevice | Session.unregisterDevice}
  external dynamic /*Promise<void>*/ registerDevice(dynamic options);

  /// Unregisters mobile device, one user can be connected to one mobile device.
  ///
  /// @remarks
  /// Related method: {@link Session.registerDevice | Session.registerDevice}
  external dynamic /*Promise<void>*/ unregisterDevice();

  // private _selectConversationInActiveInbox;

  ///
  /// Used to listen to TalkJS session events
  ///
  /// @remarks
  /// A "message" event is fired every time a message is sent or received by the
  /// current user (even if no TalkJS UI is visible). Your `handler` function is passed
  /// a {@link Message} object with some information about each message and its conversation.
  ///
  /// For an example, see {@link https://gist.github.com/eteeselink/607e585eb40be76f2ed150d4090e5261}
  ///
  /// Related method: {@link Session.off | Session.off}
  ///
  external void on(String eventType, Function handler);

  /// Used to stop listening to specific TalkJS session events
  ///
  /// @remarks
  /// Call this with the same `eventType` and `handler` to stop receiving events.
  ///
  /// Related methods: {@link Session.on | Session.on}
  external void off(String eventType, Function handler);

  /// Disconnects all websockets, removes all UIs, and invalidates this session.
  /// You cannot use any objects that were created in this session after you destroy it.
  ///
  /// If you want to use TalkJS after having called `destroy()` you must instantiate a new
  /// Talk.Session instance.
  external void destroy();

  /// Returns a list of all active {@link Popup} objects linked to this
  /// session.
  ///
  /// @remarks
  /// Includes popups actively created using {@link createPopup}, and also
  /// popups created on page load, if {@link PopupOptions.keepOpen} was set to
  /// `true` on an earlier page.
  ///
  /// Only includes popups that are still mounted in the DOM. So if you call
  /// `createPopup()` but later remove its container element (or an ancestor of
  /// the container), then the `Popup` object will have been made invalid and
  /// is therefore not included in the results.
  external List<Popup> getPopups();

  /// Returns a list of all active {@link Inbox} objects linked to this
  /// session.
  ///
  /// @remarks
  /// Only includes inboxes that are still mounted in the DOM. So if you call
  /// `createInbox()` but later remove its container element (or an ancestor of
  /// the container), then the `Inbox` object will have been made invalid and
  /// is therefore not included in the results.
  external List<Inbox> getInboxes();

  /// Returns a list of all active {@link Chatbox} objects linked to this
  /// session.
  ///
  /// @remarks
  /// Only includes chatboxes that are still mounted in the DOM. So if you call
  /// `createChatbox()` but later remove its container element (or an ancestor of
  /// the container), then the `Chatbox` object will have been made invalid and
  /// is therefore not included in the results.
  external List<Chatbox> getChatboxes();
}

@JS()
@anonymous
class SessionOptions {
  external factory SessionOptions();

  /// Your app's unique TalkJS id. Get it from the dashboard. */
  external String appId;

  /// A `User` object that identifies the currently active user.
  /// The user is uniquely identified by their id; all other fields
  /// (name, photo, etc) are overwritten in the TalkJS database each
  /// time they change.
  /// Alternatively, only pass a user ID (as a string) if you are certain
  /// that the user object exists. */
  external User me;

  /// If you use
  /// {@link https://talkjs.com/docs/Features/Identity_Verification.html | Identitiy verification}
  /// make sure you generate and use a signature.
  external String? signature;
}

/// Used to configure supported third-party integrations with TalkJS. See
/// {@link https://talkjs.com/docs/Features/Customizations/Third_Party_Integrations.html | third party integrations }
@JS()
@anonymous
class ThirdPartyOptions {
  external factory ThirdPartyOptions();

  external FullStoryOptions? fullstory;
}

/// Used as part of {@link Unreads.on}.
@JS()
@anonymous
class UnreadConversation {
  external factory UnreadConversation();

  /// Contains the last {@link Message} for an unread conversation.
  external Message lastMessage;
}

/// This object can notify you when the amount of unread conversations changes.
/// You can't instantiate it - instead, get an instance via {@link Session.unreads}.
///
@JS()
@anonymous
class Unreads {
  external factory Unreads();

  /// A "change" event is fired on startup right after TalkJS loads, as well as every time the
  /// amount of unread conversations changed. The `handler` is invoked with an array of objects with
  /// limited information about each conversation, see {@link UnreadConversation}.
  ///
  /// @remarks
  /// Related methods: {@link Unreads.off}
  external void on(String eventType, Function handler);

  /// Call this with the same `eventType` and `handler` that you used for `on` to
  /// stop receiving events.
  ///
  /// @remarks
  /// Related methods: {@link Unreads.on}
  external void off(String eventType, Function handler);
}

@JS()
@anonymous
class PopupOptions {
  external factory PopupOptions();

  /// Controls the text direction (for supporting right-to-left languages such as Arabic and Hebrew). TalkJS tries
  /// to determine the appropriate text direction from the parent page, but if that does not work or you want to
  /// explicitly control it, you can override it here. Defaults to "rtl".
  /// "rtl" | "ltr"
  external String? dir;

  /// Sets the message input box to the given text.
  /// You can use this to suggest a certain initial message to be sent. The user can still edit it before hitting "send".
  ///
  /// @deprecated We recommend using {@link MessageField.setText} before mounting the chatbox to precisely control when message suggestions are shown.
  external String? messageSuggestion;

  /// Used to control if the Chat Header is displayed in the UI. Defaults to true.
  external bool? showChatHeader;

  /// Controls what text appears in the chat title, in the header above the messages.
  /// Defaults to `"participants"`.
  ///
  /// (also see {@link this.chatSubtitleMode} and {@link InboxOptions.feedConversationTitleMode})
  /// "subject" | "participants"
  external String? chatTitleMode;

  /// Controls what text appears in the chat subtitle, right below the chat title.
  /// No subtitle is displayed when the conversation has no subject set or when set to `null`.
  /// Defaults to `"subject"`.
  ///
  /// (also see {@link this.chatTitleMode} and {@link InboxOptions.feedConversationTitleMode})
  /// "subject" | "participants"
  external String? chatSubtitleMode;

  /// TalkJS leverages `iframe`s behind the scenes and therefore not all services that you use in your app will work out of the box.
  /// This option adds support for a number of services to help you use them. Let us know if you're missing any.
  external ThirdPartyOptions thirdparties;

  /// Used to control which messages are shown in the message list, depending on a type, origin
  /// or custom message attributes.
  ///
  /// See {@link MessagePredicate} for all available options.
  ///
  /// You can also modify the filter on the fly using {@link UIBox.setMessageFilter}.
  external MessagePredicate? messageFilter;

  /// TalkJS can translate conversations to the current user's locale using Google Translate.
  /// This option specifies which conversations should be translated in this UI. You can pass a boolean to enable/disable
  /// translation for all conversations, "auto" to enable translation on conversations where users have different locales,
  /// or you can pass an array of {@link ConversationBuilder}s or conversation Ids to be translated.
  /// This feature is only available on the Premium plan and above. Make sure you add your Google Translate API key in the dashboard.

  external dynamic /*bool | "auto" | List<String> | List<ConversationBuilder>*/ translateConversations;

  /// Set this to `true` to show a translation toggle in all conversations.
  /// Set this to `"auto"` to show a translation toggle in conversations where there are participants with different locales.
  /// This setting defaults to `false`, meaning that no toggles will be shown.
  /// In order to use this, you must be on the Premium plan, and set a Google Translate API key in the dashboard.
  external dynamic /*bool | "auto" | null */ showTranslationToggle;

  /// Settings that affect the behavior of the message field
  external MessageFieldOptions? messageField;

  /// If enabled, the Popup will reopen every time
  /// the user navigates to another page. This way, a conversation can continue
  /// while the user browses around. Set to `false` to disable this behavior.
  ///
  /// Defaults to false.
  external bool? keepOpen;

  /// Specifies whether to show a round
  /// launcher and/or close button beneath the popup in the right bottom corner
  /// of the page.
  ///
  /// @remarks
  /// `"close-only"`: show a close button beneath the popup, but don't show a launch button
  ///
  /// `"always"`: show a launch button when the popup is closed, show a close button when it is visible
  ///
  /// `"never"`: never show a launcher
  ///
  /// Note: if you choose `"never"` you may want to override the positioning of the popup as well.
  /// Just tune the `__talkjs_popup` class in your CSS.
  ///
  /// Ignored on mobile, where the popup fills the entire screen so the value is effectively `"never"`.
  ///
  /// Defaults to `"always"`.
  /// "close-only" | "always" | "never"
  external String? launcher;

  /// Whether to show the "x" icon in the popup header to close the popup.
  /// "auto", which is the default value means `true` on mobile and to `false` on desktop.
  external dynamic /*bool|"auto"|null*/ showCloseInHeader;
}

@JS('ready')
external dynamic /*Promise<void>*/ get ready;

/// Event data triggered from {@link Inbox.on | Inbox.on("selectConversation")}.
@JS()
@anonymous
class SelectConversationEvent {
  external factory SelectConversationEvent();

  /// The current TalkJS {@link User}
  external UserData me;

  /// The other participants in the conversation that are not the current user
  external List<UserData> others;

  /// The current conversation object
  external ConversationData conversation;

  /// Prevents the clicked conversation from being selected.
  external void preventDefault();
}
