@implementation LibraryFilterOptionsController

+ (BOOL)isFilteringToFavoritesWithStorageKey:(id)a3 legacyStorageKey:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = sub_100484A88();
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v8);
  return v9 & 1;
}

+ (void)updateFavoriteFilter:(BOOL)a3 storageKey:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v6 = v5;
  sub_100484D78(a3);
  swift_bridgeObjectRelease(v6);
}

- (_TtC5Music30LibraryFilterOptionsController)init
{
  _TtC5Music30LibraryFilterOptionsController *result;

  result = (_TtC5Music30LibraryFilterOptionsController *)_swift_stdlib_reportUnimplementedInitializer("Music.LibraryFilterOptionsController", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music30LibraryFilterOptionsController_filterOptionDidChange), *(_QWORD *)&self->filterOptionDidChange[OBJC_IVAR____TtC5Music30LibraryFilterOptionsController_filterOptionDidChange]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music30LibraryFilterOptionsController____lazy_storage___filterButton));
  swift_release();
}

@end
