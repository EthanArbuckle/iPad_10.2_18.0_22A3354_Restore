@implementation CentralizedFeedbackDaemon

- (_TtC9feedbackd25CentralizedFeedbackDaemon)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9feedbackd25CentralizedFeedbackDaemon_listener) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CentralizedFeedbackDaemon();
  return -[CentralizedFeedbackDaemon init](&v3, "init");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC9feedbackd25CentralizedFeedbackDaemon *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10004BF84(v7);

  return v9 & 1;
}

- (void)invalidateDonationWithDonationJSON:(id)a3 completion:(id)a4
{
  sub_100046828(self, (int)a2, a3, a4, (uint64_t)&unk_10006ABB8, (uint64_t)sub_10004ED04, (void (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_10004C4F8);
}

- (void)donateWithDonationJSON:(id)a3 completion:(id)a4
{
  sub_100046D00(self, (int)a2, a3, a4, (void (*)(uint64_t, unint64_t, id, void *))sub_10004C764);
}

- (void)presentedDonationWithEvaluationID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC9feedbackd25CentralizedFeedbackDaemon *v13;
  uint64_t v14;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_10006AB40, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  sub_10004D3E8((uint64_t)v10, (uint64_t)sub_10004ED04, v12);

  swift_release(v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)presentedInteractionWithInteractionJSON:(id)a3 completion:(id)a4
{
  sub_100046828(self, (int)a2, a3, a4, (uint64_t)&unk_10006AAF0, (uint64_t)sub_10004E9D4, (void (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_10004D71C);
}

- (void)recordEvaluationWithEvaluationJSON:(id)a3 completion:(id)a4
{
  sub_100046D00(self, (int)a2, a3, a4, (void (*)(uint64_t, unint64_t, id, void *))sub_10004D9B8);
}

- (void)fetchEvaluationWithEvaluationID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC9feedbackd25CentralizedFeedbackDaemon *v13;
  uint64_t v14;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_10006AA50, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  sub_10004E02C((uint64_t)v10, (uint64_t)sub_10004ED08, v12, 0xD000000000000029, 0x800000010005C730, (uint64_t)&unk_10006AA78, (uint64_t)&unk_1000703B8);

  swift_release(v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)fetchDonationWithEvaluationID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC9feedbackd25CentralizedFeedbackDaemon *v13;
  uint64_t v14;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_10006AA00, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  sub_10004E02C((uint64_t)v10, (uint64_t)sub_10004ED08, v12, 0xD000000000000027, 0x800000010005C6E0, (uint64_t)&unk_10006AA28, (uint64_t)&unk_100070398);

  swift_release(v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)fetchDonationsWithCount:(unsigned int)a3 fromLatest:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  _TtC9feedbackd25CentralizedFeedbackDaemon *v10;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_10006A9B0, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = self;
  sub_10004E308(a3, a4, (uint64_t)sub_10004ED08, v9);

  swift_release(v9);
}

- (void)remoteEvaluateWithRequest:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, unint64_t, uint64_t);
  _TtC9feedbackd25CentralizedFeedbackDaemon *v13;

  v6 = _Block_copy(a4);
  v7 = a3;
  v13 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;

  if (v6)
  {
    v11 = swift_allocObject(&unk_10006A988, 24, 7);
    *(_QWORD *)(v11 + 16) = v6;
    v12 = sub_1000428E8;
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  sub_100048C08(v8, v10, v12, v11);
  sub_1000429E4((uint64_t)v12, v11);
  sub_100012720(v8, v10);

}

- (void).cxx_destruct
{

}

@end
