@implementation TTRISIEIndexRequestHandler

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC32RemindersSpotlightIndexExtension26TTRISIEIndexRequestHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_100004744(v7, (void (**)(_QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC32RemindersSpotlightIndexExtension26TTRISIEIndexRequestHandler *v11;

  v8 = _Block_copy(a5);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  _Block_copy(v8);
  v10 = a3;
  v11 = self;
  sub_1000049B4(v10, v9, (void (**)(_QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v9);
}

- (id)dataForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  _TtC32RemindersSpotlightIndexExtension26TTRISIEIndexRequestHandler *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  Class isa;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v14 = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_100005B8C(v15, v9, v11, v12, v14);
  v19 = v18;
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);

  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100006900(v17, v19);
  return isa;
}

- (_TtC32RemindersSpotlightIndexExtension26TTRISIEIndexRequestHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRISIEIndexRequestHandler();
  return -[TTRISIEIndexRequestHandler init](&v3, "init");
}

@end
