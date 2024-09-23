@implementation LibraryPlacesCollectionViewManager

- (UICollectionViewDataSource)dataSource
{
  _TtC4Maps34LibraryPlacesCollectionViewManager *v2;
  id v3;

  v2 = self;
  v3 = sub_1001C3558();

  return (UICollectionViewDataSource *)v3;
}

- (_TtC4Maps34LibraryPlacesCollectionViewManager)init
{
  _TtC4Maps34LibraryPlacesCollectionViewManager *result;

  result = (_TtC4Maps34LibraryPlacesCollectionViewManager *)_swift_stdlib_reportUnimplementedInitializer("Maps.LibraryPlacesCollectionViewManager", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC4Maps34LibraryPlacesCollectionViewManager_placesDataProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps34LibraryPlacesCollectionViewManager_libraryDataOperationsProvider));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps34LibraryPlacesCollectionViewManager_cachedItems));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps34LibraryPlacesCollectionViewManager_cellActionHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps34LibraryPlacesCollectionViewManager____lazy_storage___diffableDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps34LibraryPlacesCollectionViewManager____lazy_storage___listLayout));

}

@end
