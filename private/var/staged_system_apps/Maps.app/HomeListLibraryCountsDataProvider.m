@implementation HomeListLibraryCountsDataProvider

- (id)observers
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_observers));
}

- (BOOL)hasInitialData
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_hasInitialData);
}

- (void)setHasInitialData:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_hasInitialData) = a3;
}

- (BOOL)active
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_active);
}

- (void)setActive:(BOOL)a3
{
  uint64_t v3;
  _TtC4Maps33HomeListLibraryCountsDataProvider *v4;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_active) = a3;
  if (a3)
  {
    v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_countsManager);
    if ((*(_BYTE *)(v3 + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_isFetching) & 1) == 0)
    {
      *(_BYTE *)(v3 + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_isFetching) = 1;
      v4 = self;
      sub_1001CC100();

    }
  }
}

- (_TtC4Maps17LibraryItemsCount)counts
{
  return (_TtC4Maps17LibraryItemsCount *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.isa
                                                                                            + OBJC_IVAR____TtC4Maps33HomeListLibraryCountsDataProvider_countsManager)
                                                                                 + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_lastFetchedCounts));
}

- (_TtC4Maps33HomeListLibraryCountsDataProvider)initWithCountsManager:(id)a3
{
  return (_TtC4Maps33HomeListLibraryCountsDataProvider *)sub_100096D64(a3);
}

- (void)notifyObserversIfNeeded
{
  _TtC4Maps33HomeListLibraryCountsDataProvider *v2;

  v2 = self;
  sub_100096E90();

}

- (void)libraryItemsCountManager:(id)a3 didUpdateCounts:(id)a4
{
  id v6;
  id v7;
  _TtC4Maps33HomeListLibraryCountsDataProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100096E90();

}

- (_TtC4Maps33HomeListLibraryCountsDataProvider)init
{
  _TtC4Maps33HomeListLibraryCountsDataProvider *result;

  result = (_TtC4Maps33HomeListLibraryCountsDataProvider *)_swift_stdlib_reportUnimplementedInitializer("Maps.HomeListLibraryCountsDataProvider", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
