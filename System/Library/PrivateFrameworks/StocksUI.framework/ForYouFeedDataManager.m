@implementation ForYouFeedDataManager

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC8StocksUI21ForYouFeedDataManager *v4;
  _TtC8StocksUI21ForYouFeedDataManager *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_priceDataManager), *(_QWORD *)&self->priceDataManager[OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_priceDataManager]);
  sub_1DC080808(&qword_1EDB32888, (uint64_t (*)(uint64_t))type metadata accessor for ForYouFeedDataManager, (uint64_t)&unk_1DC42ACB8);
  v4 = self;
  sub_1DC400D18();
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_watchlistManager), *(_QWORD *)&v4->priceDataManager[OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_watchlistManager]);
  sub_1DC080808(&qword_1EDB32890, (uint64_t (*)(uint64_t))type metadata accessor for ForYouFeedDataManager, (uint64_t)&unk_1DC42AC88);
  v5 = v4;
  sub_1DC400AD8();

  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[ForYouFeedDataManager dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1DC148A20((uint64_t)self + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_priceDataManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_feedService);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_appConfigurationManager);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_watchlistManager);

  sub_1DC0B091C((uint64_t)self + OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_lastRefreshDate, &qword_1EDB28AC0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870]);
  swift_bridgeObjectRelease();
}

- (_TtC8StocksUI21ForYouFeedDataManager)init
{
  _TtC8StocksUI21ForYouFeedDataManager *result;

  result = (_TtC8StocksUI21ForYouFeedDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3
{
  char *v5;
  uint64_t result;
  uint64_t v7;
  void (*v8)(void);
  id v9;
  char *v10;

  v5 = &a1[OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_delegate];
  result = MEMORY[0x1DF0CAD78](&a1[OBJC_IVAR____TtC8StocksUI21ForYouFeedDataManager_delegate]);
  if (result)
  {
    v7 = *((_QWORD *)v5 + 1);
    swift_getObjectType();
    v8 = *(void (**)(void))(v7 + 16);
    v9 = a3;
    v10 = a1;
    v8();

    return swift_unknownObjectRelease();
  }
  return result;
}

@end
