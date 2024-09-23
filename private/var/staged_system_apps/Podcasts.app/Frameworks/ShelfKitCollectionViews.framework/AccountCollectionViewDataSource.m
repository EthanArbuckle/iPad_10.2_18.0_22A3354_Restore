@implementation AccountCollectionViewDataSource

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews31AccountCollectionViewDataSource *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = AccountPresenter.sectionCount.getter();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC23ShelfKitCollectionViews31AccountCollectionViewDataSource *v7;
  Swift::Int v8;

  v6 = a3;
  v7 = self;
  v8 = AccountPresenter.numberOfItems(in:)(a4);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC23ShelfKitCollectionViews31AccountCollectionViewDataSource *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_10A440(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC23ShelfKitCollectionViews31AccountCollectionViewDataSource *v17;
  id v18;
  __n128 v19;
  uint64_t v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  v18 = sub_10A72C(v16, v13, v15);

  v19 = swift_bridgeObjectRelease(v15);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
  return v18;
}

- (_TtC23ShelfKitCollectionViews31AccountCollectionViewDataSource)init
{
  _TtC23ShelfKitCollectionViews31AccountCollectionViewDataSource *result;

  result = (_TtC23ShelfKitCollectionViews31AccountCollectionViewDataSource *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.AccountCollectionViewDataSource", 55, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountCollectionViewDataSource_presenter));
}

@end
