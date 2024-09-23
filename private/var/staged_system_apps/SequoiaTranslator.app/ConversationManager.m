@implementation ConversationManager

- (_TtC17SequoiaTranslator19ConversationManager)init
{
  uint64_t ObjectType;
  _TtC17SequoiaTranslator19ConversationManager *v4;
  _QWORD v6[5];
  char v7;

  ObjectType = swift_getObjectType(self);
  v6[0] = 0;
  v7 = 0;
  v4 = (_TtC17SequoiaTranslator19ConversationManager *)sub_10008137C((uint64_t)v6);
  swift_deallocPartialClassInstance(self, ObjectType, *(unsigned int *)((swift_isaMask & (uint64_t)self->super.isa) + 0x30), *(unsigned __int16 *)((swift_isaMask & (uint64_t)self->super.isa) + 0x34));
  return v4;
}

- (void)handleRouteChangeWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = type metadata accessor for Notification(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  sub_100081594();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)handleAudioInterruptionWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC17SequoiaTranslator19ConversationManager *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1000777B8();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)handleResignWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t KeyPath;
  uint64_t v10;
  _TtC17SequoiaTranslator19ConversationManager *v11;
  id v12[5];
  char v13;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  KeyPath = swift_getKeyPath(&unk_1001EB1F8);
  v10 = swift_getKeyPath(&unk_1001EB220);
  v11 = self;
  static Published.subscript.getter(v12, v11, KeyPath);
  swift_release(KeyPath);
  swift_release(v10);
  if (v13 == 2)
  {

    sub_100079BF0(0, 0, 0);
  }
  else
  {
    sub_1000758CC((uint64_t)v12);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void).cxx_destruct
{
  uint64_t v3;
  void *v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__useCannedSpeech);
  v3 = *(_QWORD *)&self->_useCannedSpeech[OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__useCannedSpeech];
  swift_release(*(_QWORD *)&self->_useCannedSpeech[OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__useCannedSpeech
                                                 + 16]);
  swift_release(v3);

  v5 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__sourceLocale;
  v6 = sub_100006DF4(&qword_10028F270);
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__targetLocale, v6);
  v8 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__textTranslationLocale;
  v9 = sub_100006DF4((uint64_t *)&unk_100292540);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v7((char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__visualTranslationLocale, v6);
  v10 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__state;
  v11 = sub_100006DF4(&qword_10028F278);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__audioLevel;
  v13 = sub_100006DF4((uint64_t *)&unk_10028F240);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v14 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__currentlyPlayingTTS;
  v15 = sub_100006DF4(&qword_10028B5B8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  v16 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager__lastPlayingWord;
  v17 = sub_100006DF4((uint64_t *)&unk_10028F230);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager_session));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager_recordingHelper));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager_subscriptions));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator19ConversationManager_stateSubscription));
}

- (void)speechActivityDetected
{
  _TtC17SequoiaTranslator19ConversationManager *v2;

  v2 = self;
  sub_10007E314();

}

- (void)languageDetectionResult:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator19ConversationManager *v5;

  v4 = a3;
  v5 = self;
  sub_10007E6A0(v4);

}

- (void)speechRecognitionResult:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator19ConversationManager *v5;

  v4 = a3;
  v5 = self;
  sub_10007EFBC(v4);

}

- (void)translatorDidTranslate:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator19ConversationManager *v5;

  v4 = a3;
  v5 = self;
  sub_10007F658(v4);

}

- (void)translationDidFinishWithError:(id)a3
{
  _TtC17SequoiaTranslator19ConversationManager *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_10007FD3C((uint64_t)a3);

}

- (void)_accessbilityEvaluateTurnData:(id)a3 languageCode:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _TtC17SequoiaTranslator19ConversationManager *v12;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = self;
  sub_1000823B0(v6, v8, v9, v11);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v11);
}

@end
