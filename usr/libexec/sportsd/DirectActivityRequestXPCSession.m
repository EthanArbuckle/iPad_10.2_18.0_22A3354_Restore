@implementation DirectActivityRequestXPCSession

- (void)dealloc
{
  _TtC7sportsd31DirectActivityRequestXPCSession *v2;

  v2 = self;
  sub_100051198();
}

- (void).cxx_destruct
{
  sub_100023FB4((Class *)((char *)&self->super.super.isa
                        + OBJC_IVAR____TtC7sportsd31DirectActivityRequestXPCSession_subscriptionOperation));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC7sportsd31DirectActivityRequestXPCSession_cancellables));
  swift_release(*(_QWORD *)&self->super.connection[OBJC_IVAR____TtC7sportsd31DirectActivityRequestXPCSession_autostartStatus]);
}

- (void)createSessionWithCanonicalId:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _TtC7sportsd31DirectActivityRequestXPCSession *v10;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  v10 = self;
  sub_1000512FC(v7, v9, (uint64_t)v10, (uint64_t)v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v9);
}

- (void)createActivityWithCanonicalId:(id)a3 supplementaryData:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _TtC7sportsd31DirectActivityRequestXPCSession *v13;
  __n128 v14;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a4)
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v12 = swift_allocObject(&unk_1000C5770, 24, 7);
  *(_QWORD *)(v12 + 16) = v8;
  v13 = self;
  sub_100051370(v9, v11, (uint64_t)a4, (void (*)(void))sub_1000523FC, v12, v14);

  swift_bridgeObjectRelease(v11);
  swift_release(v12);
  swift_bridgeObjectRelease(a4);
}

@end
