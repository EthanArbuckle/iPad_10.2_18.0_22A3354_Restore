@implementation Catalog

- (void)fetchEpisodesWithStoreIds:(id)a3 resultsHandler:(id)a4
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  _TtC11PodcastsKit7Catalog *v8;

  v5 = _Block_copy(a4);
  type metadata accessor for StoreId();
  v6 = sub_22FB37BC0();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = self;
  sub_22FB3256C(v6, (uint64_t)sub_22FB2C7C0, v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)fetchShowsWithStoreIds:(id)a3 resultsHandler:(id)a4
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  _TtC11PodcastsKit7Catalog *v8;

  v5 = _Block_copy(a4);
  type metadata accessor for StoreId();
  v6 = sub_22FB37BC0();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = self;
  sub_22FB3258C(v6, (uint64_t)sub_22FB2C7A0, v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC11PodcastsKit7Catalog)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Catalog();
  return -[Catalog init](&v3, sel_init);
}

@end
