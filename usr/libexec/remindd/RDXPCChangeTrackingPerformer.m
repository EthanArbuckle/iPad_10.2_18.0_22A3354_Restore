@implementation RDXPCChangeTrackingPerformer

- (void)currentChangeToken:(id)a3
{
  void *v4;
  _TtC7remindd28RDXPCChangeTrackingPerformer *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100327B74((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)currentChangeTokenForAccountTypes:(int64_t)a3 completion:(id)a4
{
  void *v6;
  _TtC7remindd28RDXPCChangeTrackingPerformer *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_100327C90(a3, (uint64_t)v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)currentChangeTokenForAccountID:(id)a3 completion:(id)a4
{
  sub_10032605C(self, (int)a2, (uint64_t)a3, a4, "currentChangeToken for {accountID: %{public}s}", (SEL *)&selRef_currentChangeTokenForAccountID_);
}

- (void)earliestChangeTokenForAccountID:(id)a3 completion:(id)a4
{
  sub_10032605C(self, (int)a2, (uint64_t)a3, a4, "earliestChangeToken for {accountID: %{public}s}", (SEL *)&selRef_earliestChangeTokenForAccountID_);
}

- (void)getTrackingStateWithClientID:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC7remindd28RDXPCChangeTrackingPerformer *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1007EEDF0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  swift_unknownObjectRetain(a3);
  v8 = self;
  sub_1003260F4(a3, (uint64_t)sub_100327B6C, v7);
  swift_unknownObjectRelease(a3);

  swift_release(v7);
}

- (void)saveTrackingState:(id)a3 withClientID:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC7remindd28RDXPCChangeTrackingPerformer *v11;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1007EEDC8, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  swift_unknownObjectRetain(a4);
  v11 = self;
  sub_100326404(v10, a4, (uint64_t)sub_100119B24, v9);

  swift_unknownObjectRelease(a4);
  swift_release(v9);
}

- (void)fetchHistoryAfterToken:(id)a3 entityNames:(id)a4 transactionFetchLimit:(unint64_t)a5 completionHandler:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC7remindd28RDXPCChangeTrackingPerformer *v14;

  v10 = _Block_copy(a6);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v12 = swift_allocObject(&unk_1007EEDA0, 24, 7);
  *(_QWORD *)(v12 + 16) = v10;
  v13 = a3;
  v14 = self;
  sub_1003267B4(a3, v11, a5, (uint64_t)sub_100327FF8, v12);

  swift_bridgeObjectRelease();
  swift_release(v12);
}

- (void)fetchHistoryAfterDate:(id)a3 entityNames:(id)a4 transactionFetchLimit:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _TtC7remindd28RDXPCChangeTrackingPerformer *v18;
  uint64_t v19;

  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v17 = swift_allocObject(&unk_1007EED78, 24, 7);
  *(_QWORD *)(v17 + 16) = v15;
  v18 = self;
  sub_100326B94((uint64_t)v14, v16, a5, (uint64_t)sub_100327B6C, v17);

  swift_bridgeObjectRelease();
  swift_release(v17);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)deleteHistoryBeforeToken:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC7remindd28RDXPCChangeTrackingPerformer *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1007EED50, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_100326F8C(v8, (uint64_t)sub_100119B24, v7);

  swift_release(v7);
}

- (void)deleteHistoryBeforeDate:(id)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC7remindd28RDXPCChangeTrackingPerformer *v13;
  uint64_t v14;

  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_1007EED28, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  sub_10032728C((uint64_t)v10, (uint64_t)sub_10011701C, v12);

  swift_release(v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)fetchAuxiliaryChangeInfos:(id)a3 completionHandler:(id)a4
{
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC7remindd28RDXPCChangeTrackingPerformer *v10;

  v6 = _Block_copy(a4);
  v7 = sub_1001A9820();
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = swift_allocObject(&unk_1007EED00, 24, 7);
  *(_QWORD *)(v9 + 16) = v6;
  v10 = self;
  sub_100327628(v8, (uint64_t)sub_100327B64, v9);

  swift_bridgeObjectRelease();
  swift_release(v9);
}

- (_TtC7remindd28RDXPCChangeTrackingPerformer)init
{
  _TtC7remindd28RDXPCChangeTrackingPerformer *result;

  result = (_TtC7remindd28RDXPCChangeTrackingPerformer *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDXPCChangeTrackingPerformer", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
