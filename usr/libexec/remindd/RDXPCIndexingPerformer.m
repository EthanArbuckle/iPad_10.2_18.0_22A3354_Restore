@implementation RDXPCIndexingPerformer

- (void)testIndexDummyItemWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC7remindd22RDXPCIndexingPerformer *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1007F45E0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10044F7A8((uint64_t)sub_100119B24, v5);

  swift_release(v5);
}

- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3
{
  void *v4;
  _TtC7remindd22RDXPCIndexingPerformer *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10044FD10((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC7remindd22RDXPCIndexingPerformer *v8;

  v6 = _Block_copy(a4);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  _Block_copy(v6);
  v8 = self;
  sub_10044FE0C(v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC7remindd22RDXPCIndexingPerformer *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject(&unk_1007F4590, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_10011701C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_100450024(v4, v5);
  sub_1000A5C24((uint64_t)v4, v5);

}

- (_TtC7remindd22RDXPCIndexingPerformer)init
{
  _TtC7remindd22RDXPCIndexingPerformer *result;

  result = (_TtC7remindd22RDXPCIndexingPerformer *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDXPCIndexingPerformer", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
