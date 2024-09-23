@implementation LibraryHomeCollectionViewManager

- (UICollectionViewDataSource)dataSource
{
  _TtC4Maps32LibraryHomeCollectionViewManager *v2;
  id v3;

  v2 = self;
  v3 = sub_1001D4470();

  return (UICollectionViewDataSource *)v3;
}

- (UICollectionViewLayout)collectionViewLayout
{
  _TtC4Maps32LibraryHomeCollectionViewManager *v2;
  id v3;

  v2 = self;
  v3 = sub_1001D4500();

  return (UICollectionViewLayout *)v3;
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC4Maps32LibraryHomeCollectionViewManager *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = *(void **)(*(char **)((char *)&self->super.isa
                           + OBJC_IVAR____TtC4Maps32LibraryHomeCollectionViewManager_countsManager)
                + OBJC_IVAR____TtC4Maps24LibraryItemsCountManager_observers);
  v5 = self;
  objc_msgSend(v4, "unregisterObserver:", v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[LibraryHomeCollectionViewManager dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC4Maps32LibraryHomeCollectionViewManager_recentsDataProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps32LibraryHomeCollectionViewManager_cellActionHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps32LibraryHomeCollectionViewManager____lazy_storage___diffableDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps32LibraryHomeCollectionViewManager____lazy_storage___compositionalLayout));
}

- (_TtC4Maps32LibraryHomeCollectionViewManager)init
{
  _TtC4Maps32LibraryHomeCollectionViewManager *result;

  result = (_TtC4Maps32LibraryHomeCollectionViewManager *)_swift_stdlib_reportUnimplementedInitializer("Maps.LibraryHomeCollectionViewManager", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)libraryItemsCountManager:(id)a3 didUpdateCounts:(id)a4
{
  id v6;
  id v7;
  _TtC4Maps32LibraryHomeCollectionViewManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1001D6004();

}

@end
