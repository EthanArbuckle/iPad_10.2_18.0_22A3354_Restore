@implementation SiriReaderDaemon

- (_TtC11sirireaderd16SiriReaderDaemon)init
{
  return (_TtC11sirireaderd16SiriReaderDaemon *)sub_1000025A4();
}

- (void)readTextWithTextTitle:(id)a3 textBody:(id)a4 textIdentifier:(id)a5 textLocale:(id)a6 textLeadingImage:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  _TtC11sirireaderd16SiriReaderDaemon *v21;

  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = v15;
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = v18;
  v20 = a7;
  v21 = self;
  sub_10000C7D8(v11, v13, v14, v16, v17, v19, a7, 0);

  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v19);
}

- (void)readTextWithTextTitle:(id)a3 textBody:(id)a4 textIdentifier:(id)a5 textLocale:(id)a6 textLeadingImage:(id)a7 activationSource:(int64_t)a8
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  _TtC11sirireaderd16SiriReaderDaemon *v23;

  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = v17;
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v21 = v20;
  v22 = a7;
  v23 = self;
  sub_10000C7D8(v13, v15, v16, v18, v19, v21, a7, a8);

  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v21);
}

- (void)getPlaybackStatusForIdentifierWithTextIdentifier:(id)a3 reply:(id)a4
{
  _QWORD *v5;
  uint64_t v6;
  _TtC11sirireaderd16SiriReaderDaemon *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  char v13;
  int v14;
  void (*v15)(_QWORD *, uint64_t);
  _TtC11sirireaderd16SiriReaderDaemon *v16;
  _QWORD *v17;
  uint64_t v18;
  _TtC11sirireaderd16SiriReaderDaemon *v19;

  v5 = _Block_copy(a4);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = self;
  v9 = v8;
  v10 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID);
  v11 = *(_QWORD *)&self->isCurrentlySeeking[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID];
  if (v11
    && (*v10 == v6 ? (v12 = v11 == v9) : (v12 = 0),
        (v12 || (v13 = _stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, v6, v9, 0), v7 = self, (v13 & 1) != 0))
     && *((_BYTE *)&v7->super.isa + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isSessionActive) == 1))
  {
    v14 = *((unsigned __int8 *)&v7->super.isa + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_isPlaying);
    v15 = (void (*)(_QWORD *, uint64_t))v5[2];
    v16 = v7;
    v17 = v5;
    if (v14 == 1)
      v18 = 2;
    else
      v18 = 3;
  }
  else
  {
    v15 = (void (*)(_QWORD *, uint64_t))v5[2];
    v19 = v7;
    v17 = v5;
    v18 = 1;
  }
  v15(v17, v18);
  _Block_release(v5);
  swift_bridgeObjectRelease(v9);

}

- (void)pausePlaybackForIdentifierWithTextIdentifier:(id)a3
{
  sub_100005798(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_100004C8C);
}

- (void)resumePlaybackForIdentifierWithTextIdentifier:(id)a3
{
  sub_100005798(self, (uint64_t)a2, (uint64_t)a3, sub_100005044);
}

- (void)endMediaSessionForIdentifierWithTextIdentifier:(id)a3
{
  sub_100005798(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1000053EC);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  char *v10;
  char *v11;
  id v12;
  _TtC11sirireaderd16SiriReaderDaemon *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  _TtC11sirireaderd16SiriReaderDaemon *v19;
  _OWORD v20[2];

  if (a3)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v11 = v10;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v20, 0, sizeof(v20));
    v18 = a5;
    v19 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v9 = 0;
  v11 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4);
  v12 = a5;
  v13 = self;
  _bridgeAnyObjectToAny(_:)(v20, a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v15 = v14;
  v16 = sub_100002294(&qword_1000192C8, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_100010B30);
  v17 = (_QWORD *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v15, (char *)&type metadata for Any + 8, v16);

LABEL_8:
  sub_10000D4FC(v9, v11, v20, v17);

  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v11);
  sub_10000D470((uint64_t)v20, &qword_100019480);
}

- (void)handlePlaybackInterruptionWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC11sirireaderd16SiriReaderDaemon *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1000085DC();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_nowPlayingInfo));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_boostToken));

  swift_bridgeObjectRelease(*(_QWORD *)&self->isCurrentlySeeking[OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentlyPlayingUUID]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_articleSentences));

  sub_10000DE24((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_instrumentationUtil));
  sub_10000D470((uint64_t)self + OBJC_IVAR____TtC11sirireaderd16SiriReaderDaemon_currentContextId, &qword_100019468);
}

@end
