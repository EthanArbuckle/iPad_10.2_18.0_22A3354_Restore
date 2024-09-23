@implementation VUIFavoritesState

- (NSArray)favorites
{
  void *v2;

  VUIFavoritesState.favorites.getter();
  type metadata accessor for VUIFavorite();
  v2 = (void *)sub_1DA1440F0();
  OUTLINED_FUNCTION_79();
  return (NSArray *)OUTLINED_FUNCTION_111(v2);
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)sub_1D9CDCD90((uint64_t)self, (uint64_t)a2, (void (*)(void))VUIFavoritesState.lastModifiedDate.getter);
}

- (_TtC8VideosUI17VUIFavoritesState)init
{
  VUIFavoritesState.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1D970F4B0((uint64_t)self + OBJC_IVAR____TtC8VideosUI17VUIFavoritesState_lastModifiedDate, (uint64_t *)&unk_1EDA877D0);
}

@end
