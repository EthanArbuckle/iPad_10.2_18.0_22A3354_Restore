@implementation RootBarStandardItemsManager

- (void)processBagItems:(id)a3
{
  uint64_t v5;
  Swift::OpaquePointer v6;
  _TtC5Books27RootBarStandardItemsManager *v7;

  v5 = type metadata accessor for RootBarItem();
  v6._rawValue = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  RootBarStandardItemsManager.processBagItems(_:)(v6);

  swift_bridgeObjectRelease(v6._rawValue);
}

- (void)loadFromCache
{
  _TtC5Books27RootBarStandardItemsManager *v2;

  v2 = self;
  RootBarStandardItemsManager.loadFromCache()();

}

- (_TtC5Books27RootBarStandardItemsManager)init
{
  _TtC5Books27RootBarStandardItemsManager *result;

  result = (_TtC5Books27RootBarStandardItemsManager *)_swift_stdlib_reportUnimplementedInitializer("Books.RootBarStandardItemsManager", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC5Books27RootBarStandardItemsManager__items;
  v4 = sub_10004CFD4((uint64_t *)&unk_1009EE4E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books27RootBarStandardItemsManager_restrictionProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books27RootBarStandardItemsManager____lazy_storage___bag));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC5Books27RootBarStandardItemsManager_cacheManager));

}

@end
