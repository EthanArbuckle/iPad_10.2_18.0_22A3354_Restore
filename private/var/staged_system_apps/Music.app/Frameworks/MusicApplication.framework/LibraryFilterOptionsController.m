@implementation LibraryFilterOptionsController

+ (BOOL)isFilteringToFavoritesWithStorageKey:(id)a3 legacyStorageKey:(id)a4
{
  id v6;
  id v7;
  char v8;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v6 = a3;
  v7 = a4;
  v8 = sub_ABE448();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

+ (void)updateFavoriteFilter:(BOOL)a3 storageKey:(id)a4
{
  id v6;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v6 = a4;
  sub_ABE738(a3);

  swift_bridgeObjectRelease();
}

- (_TtC16MusicApplication30LibraryFilterOptionsController)init
{
  _TtC16MusicApplication30LibraryFilterOptionsController *result;

  result = (_TtC16MusicApplication30LibraryFilterOptionsController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.LibraryFilterOptionsController", 47, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16MusicApplication30LibraryFilterOptionsController_filterOptionDidChange), *(_QWORD *)&self->filterOptionDidChange[OBJC_IVAR____TtC16MusicApplication30LibraryFilterOptionsController_filterOptionDidChange]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication30LibraryFilterOptionsController____lazy_storage___filterButton));
  swift_release();
}

@end
