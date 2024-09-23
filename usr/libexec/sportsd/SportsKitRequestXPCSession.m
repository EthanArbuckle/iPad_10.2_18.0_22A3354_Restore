@implementation SportsKitRequestXPCSession

- (void)dealloc
{
  _TtC7sportsd26SportsKitRequestXPCSession *v2;

  v2 = self;
  sub_10006E58C();
}

- (void).cxx_destruct
{
  sub_100023FB4((Class *)((char *)&self->super.super.isa
                        + OBJC_IVAR____TtC7sportsd26SportsKitRequestXPCSession_subscriptionOperation));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC7sportsd26SportsKitRequestXPCSession_activityCapUtility));
}

- (void)subscribeToEventWithEventId:(id)a3 subscriptionType:(id)a4 context:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _TtC7sportsd26SportsKitRequestXPCSession *v18;

  v10 = _Block_copy(a6);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = v15;
  v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String, &type metadata for String, &protocol witness table for String);
  _Block_copy(v10);
  v18 = self;
  sub_10006E6EC(v11, v13, v14, v16, v17, (uint64_t)v18, v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)unsubscribeFromEventWithEventId:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _TtC7sportsd26SportsKitRequestXPCSession *v10;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  v10 = self;
  sub_10006F720(v7, v9, (uint64_t)v10, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)unsubscribeFromEventsWithEventIds:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC7sportsd26SportsKitRequestXPCSession *v8;

  v6 = _Block_copy(a4);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  _Block_copy(v6);
  v8 = self;
  sub_10006FE94(v7, (char *)v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)unsubscribeFromAllEventsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC7sportsd26SportsKitRequestXPCSession *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1000C80F0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_100070648((uint64_t)sub_1000733C0, v5);

  swift_release(v5);
}

- (void)refreshCurrentEventStateFor:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  sub_100071E30(self, (int)a2, (uint64_t)a3, a4, a5, (uint64_t)&unk_1000C80A0, (uint64_t)sub_1000733C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100070A70);
}

- (void)flushMetrics
{
  _TtC7sportsd26SportsKitRequestXPCSession *v2;

  v2 = self;
  sub_100070DA0();

}

- (void)createSessionFor:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  sub_10007149C(self, (int)a2, (uint64_t)a3, a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, id, void *))sub_100070E14);
}

- (void)createActivityFor:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  sub_10007149C(self, (int)a2, (uint64_t)a3, a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, id, void *))sub_100070E74);
}

- (void)destroySessionFor:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  sub_100071E30(self, (int)a2, (uint64_t)a3, a4, a5, (uint64_t)&unk_1000C8028, (uint64_t)sub_1000733C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100071524);
}

- (void)destroyActivityFor:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC7sportsd26SportsKitRequestXPCSession *v12;
  uint64_t v13;

  v7 = _Block_copy(a5);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = swift_allocObject(&unk_1000C7FB0, 24, 7);
  *(_QWORD *)(v11 + 16) = v7;
  v12 = self;
  sub_100071528(v8, v10, v13, (uint64_t)sub_1000730DC, v11);

  swift_bridgeObjectRelease();
  swift_release(v11);
}

- (void)checkForSessionFor:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  sub_100071E30(self, (int)a2, (uint64_t)a3, a4, a5, (uint64_t)&unk_1000C7F88, (uint64_t)sub_1000733F4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100071D50);
}

- (void)checkForActivityFor:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC7sportsd26SportsKitRequestXPCSession *v12;
  uint64_t v13;

  v7 = _Block_copy(a5);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = swift_allocObject(&unk_1000C7F38, 24, 7);
  *(_QWORD *)(v11 + 16) = v7;
  v12 = self;
  sub_100071D64(v8, v10, v13, (uint64_t)sub_10007302C, v11);

  swift_bridgeObjectRelease();
  swift_release(v11);
}

- (void)liveActivitiesEnabledWithCompletion:(id)a3
{
  void *v4;
  _TtC7sportsd26SportsKitRequestXPCSession *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1000721E8((uint64_t)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);

}

- (void)signalWithDemand:(NSDictionary *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSDictionary *v8;
  _TtC7sportsd26SportsKitRequestXPCSession *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject(&unk_1000C7F10, 40, 7);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_100072558((uint64_t)&unk_1000D2C00, (uint64_t)v7);
}

- (void)subscribeTo:(NSString *)a3 topic:(NSString *)a4 completionHandler:(id)a5
{
  sub_1000728B4(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1000C7EE8, (uint64_t)&unk_1000D2BE8);
}

- (void)unsubscribeFrom:(NSString *)a3 topic:(NSString *)a4 completionHandler:(id)a5
{
  sub_1000728B4(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1000C7E48, (uint64_t)&unk_1000D2BA0);
}

@end
