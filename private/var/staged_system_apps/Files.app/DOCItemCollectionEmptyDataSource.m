@implementation DOCItemCollectionEmptyDataSource

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v11;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v9 = objc_msgSend(objc_allocWithZone((Class)UICollectionViewCell), "init");
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v9;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 0;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 0;
}

- (_TtC5FilesP33_664BDA1BFD913E39306EB619EE43EF3832DOCItemCollectionEmptyDataSource)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCItemCollectionEmptyDataSource();
  return -[DOCItemCollectionEmptyDataSource init](&v3, "init");
}

@end
