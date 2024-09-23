@implementation LibraryItemsCountManager

+ (_TtC4Maps24LibraryItemsCountManager)sharedManager
{
  if (qword_1014910E0 != -1)
    swift_once(&qword_1014910E0, sub_1001CBA20);
  return (_TtC4Maps24LibraryItemsCountManager *)(id)static LibraryItemsCountManager.shared;
}

- (_TtC4Maps17LibraryItemsCount)lastFetchedCounts
{
  return (_TtC4Maps17LibraryItemsCount *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_lastFetchedCounts));
}

- (void)setLastFetchedCounts:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_lastFetchedCounts);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_lastFetchedCounts) = (Class)a3;
  v3 = a3;

}

- (_TtC4Maps24LibraryItemsCountManager)init
{
  return (_TtC4Maps24LibraryItemsCountManager *)sub_1001CBB30();
}

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  _TtC4Maps24LibraryItemsCountManager *v5;
  id v6;
  _TtC4Maps24LibraryItemsCountManager *v7;
  objc_super v8;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_observerToken);
  if (v3)
  {
    v4 = (void *)objc_opt_self(NSNotificationCenter);
    v5 = self;
    swift_unknownObjectRetain(v3);
    v6 = objc_msgSend(v4, "defaultCenter");
    objc_msgSend(v6, "removeObserver:", v3);
    swift_unknownObjectRelease(v3);

  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LibraryItemsCountManager();
  -[LibraryItemsCountManager dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_observerToken));

}

- (void)registerObserver:(id)a3
{
  sub_1001CC018(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, id, uint64_t))sub_1001CD550);
}

- (void)unregisterObserver:(id)a3
{
  sub_1001CC018(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, id, uint64_t))sub_1001CD56C);
}

- (void)setNeedsRefresh
{
  _TtC4Maps24LibraryItemsCountManager *v2;

  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_isFetching) & 1) == 0)
  {
    *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_isFetching) = 1;
    v2 = self;
    sub_1001CC100();

  }
}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
  id v5;
  _TtC4Maps24LibraryItemsCountManager *v6;

  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_isFetching) & 1) == 0)
  {
    *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_isFetching) = 1;
    v5 = a3;
    v6 = self;
    sub_1001CC100();

  }
}

@end
