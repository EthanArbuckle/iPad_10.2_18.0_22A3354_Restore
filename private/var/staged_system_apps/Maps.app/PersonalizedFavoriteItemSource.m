@implementation PersonalizedFavoriteItemSource

- (NSArray)storeSubscriptionTypes
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC4Maps30PersonalizedFavoriteItemSource_storeSubscriptionTypes);
  swift_bridgeObjectRetain(v2);
  sub_100008B04((uint64_t *)&unk_101499CC0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;

  v5 = sub_100008B04((uint64_t *)&unk_101499CC0);
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC4Maps30PersonalizedFavoriteItemSource_storeSubscriptionTypes);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC4Maps30PersonalizedFavoriteItemSource_storeSubscriptionTypes) = v6;
  swift_bridgeObjectRelease(v7);
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC4Maps30PersonalizedFavoriteItemSource *v4;
  void *v5;
  _TtC4Maps30PersonalizedFavoriteItemSource *v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  type metadata accessor for MapsSyncStore(0);
  v4 = self;
  v5 = (void *)static MapsSyncStore.sharedStore.getter();
  v6 = v4;
  dispatch thunk of MapsSyncStore.unsubscribe(_:)();

  v7.receiver = v6;
  v7.super_class = ObjectType;
  -[PersonalizedFavoriteItemSource dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC4Maps30PersonalizedFavoriteItemSource_storeSubscriptionTypes));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC4Maps30PersonalizedFavoriteItemSource_queryContents));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC4Maps30PersonalizedFavoriteItemSource__allItems));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps30PersonalizedFavoriteItemSource____lazy_storage___updateQueue));

}

- (NSArray)allItems
{
  _TtC4Maps30PersonalizedFavoriteItemSource *v2;
  uint64_t v3;
  uint64_t v4;
  Class isa;
  _QWORD v7[5];
  uint64_t v8;

  v7[2] = self;
  v2 = self;
  v3 = sub_100008B04(&qword_101499CB0);
  OS_dispatch_queue.sync<A>(execute:)(&v8, sub_1000D00F4, v7, v3);

  v4 = v8;
  sub_100008B04(&qword_101499CB8);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (_TtC4Maps30PersonalizedFavoriteItemSource)init
{
  return (_TtC4Maps30PersonalizedFavoriteItemSource *)sub_1000CE8F0();
}

- (void)storeDidChangeWithTypes:(id)a3
{
  _TtC4Maps30PersonalizedFavoriteItemSource *v3;

  v3 = self;
  sub_1000CFDE0();

}

- (_TtC4Maps30PersonalizedFavoriteItemSource)initWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4
{
  _TtC4Maps30PersonalizedFavoriteItemSource *result;

  result = (_TtC4Maps30PersonalizedFavoriteItemSource *)_swift_stdlib_reportUnimplementedInitializer("Maps.PersonalizedFavoriteItemSource", 35, "init(sourceType:sourceSubtype:)", 31, 0);
  __break(1u);
  return result;
}

@end
