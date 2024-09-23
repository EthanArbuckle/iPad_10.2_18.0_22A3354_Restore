@implementation IndexRequestHandler

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC18TipsSpotlightIndex19IndexRequestHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100004270, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_100003428((uint64_t)sub_100003908, v7);

  swift_release(v7);
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC18TipsSpotlightIndex19IndexRequestHandler *v12;

  v8 = _Block_copy(a5);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v10 = swift_allocObject(&unk_1000041F8, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  v11 = a3;
  v12 = self;
  sub_100003574(v9, (uint64_t)sub_10000341C, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (_TtC18TipsSpotlightIndex19IndexRequestHandler)init
{
  uint64_t v3;
  id v4;
  _TtC18TipsSpotlightIndex19IndexRequestHandler *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC18TipsSpotlightIndex19IndexRequestHandler_searchQueryClient;
  v4 = objc_allocWithZone((Class)TPSSearchQueryClient);
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)objc_msgSend(v4, "init");

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for IndexRequestHandler();
  return -[IndexRequestHandler init](&v7, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18TipsSpotlightIndex19IndexRequestHandler_searchQueryClient));
}

@end
