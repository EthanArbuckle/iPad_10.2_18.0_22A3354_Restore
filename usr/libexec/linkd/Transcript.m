@implementation Transcript

- (_TtC10LinkDaemon10Transcript)init
{
  sub_100042484();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10LinkDaemon10Transcript_streamManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10LinkDaemon10Transcript_observers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10LinkDaemon10Transcript_nextActionObserverConnections));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10LinkDaemon10Transcript_nextActionLock));
}

- (void)donateWithActionRecord:(id)a3 reply:(id)a4
{
  sub_100047538(self, (int)a2, a3, a4, sub_100042B2C);
}

- (void)donateActionRecordData:(id)a3 writeImmediately:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _TtC10LinkDaemon10Transcript *v13;

  v5 = a4;
  v8 = _Block_copy(a5);
  v9 = a3;
  v13 = self;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;

  _Block_copy(v8);
  sub_100043EC0(v10, v12, v5, (char *)v13, v8);
  _Block_release(v8);
  sub_10001EA88(v10, (unint64_t)v12);

}

- (void)requestReadAccessWithReply:(id)a3
{
  sub_1000485A4(self, (int)a2, a3, (void (*)(void))sub_100045110);
}

- (void)deleteAllRecordsWithReply:(id)a3
{
  sub_1000485A4(self, (int)a2, a3, (void (*)(void))sub_100045D30);
}

- (void)deleteRecordsWithMatchingPredicate:(id)a3 reply:(id)a4
{
  sub_100047538(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100046014);
}

- (void)donateActionRecordData:(id)a3 bundleIdentifier:(id)a4 timestamp:(double)a5 writeImmediately:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v7;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _TtC10LinkDaemon10Transcript *v21;

  v7 = a6;
  v12 = _Block_copy(a7);
  v13 = a3;
  v14 = a4;
  v21 = self;
  v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v17 = v16;

  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v20 = v19;

  _Block_copy(v12);
  sub_1000475B4(v15, v17, v18, v20, a5, v7, v21, v12);
  _Block_release(v12);
  swift_bridgeObjectRelease(v20);
  sub_10001EA88(v15, v17);

}

- (void)requestReadAccessForStream:(id)a3 reply:(id)a4
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _TtC10LinkDaemon10Transcript *v10;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  v10 = self;
  sub_100047C7C(v7, v9, (uint64_t)v10, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v9);
}

- (void)startObservingNextActionStreamWithCompletion:(id)a3
{
  sub_1000485A4(self, (int)a2, a3, (void (*)(void))sub_100047DBC);
}

- (void)stopObservingNextActionStreamWithConnectionUUID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtC10LinkDaemon10Transcript *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  v12 = self;
  sub_1000486F0((uint64_t)v10, (uint64_t)v12, (void (**)(_QWORD, _QWORD))v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
