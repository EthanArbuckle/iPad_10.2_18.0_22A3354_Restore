@implementation LibraryArtistDetailViewController

- (void)viewDidLoad
{
  _TtC5Music33LibraryArtistDetailViewController *v2;

  v2 = self;
  sub_10016E258();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC5Music33LibraryArtistDetailViewController *v4;

  v3 = a3;
  v4 = self;
  sub_100173804(v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Music33LibraryArtistDetailViewController *v4;

  v4 = self;
  sub_100173A68(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC5Music33LibraryArtistDetailViewController *v4;

  v4 = self;
  sub_100173C3C(a3);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtC5Music33LibraryArtistDetailViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1001A8610();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC5Music33LibraryArtistDetailViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1001A87D0(a4);

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _TtC5Music33LibraryArtistDetailViewController *v17;
  void *v18;
  uint64_t v20;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  v18 = sub_100179AC0((uint64_t)v16, v13, v15, (uint64_t)v12);
  swift_bridgeObjectRelease(v15);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v18;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music33LibraryArtistDetailViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100179E3C((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (BOOL)collectionView:(void *)a3 shouldSelectItemAtIndexPath:(uint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a1;
  LOBYTE(a1) = UICollectionView.isDraggingCell(at:)();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (a1 & 1) == 0;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  _TtC5Music33LibraryArtistDetailViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (char *)a3;
  v12 = self;
  sub_10017AF04(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Music33LibraryArtistDetailViewController *v11;
  void *v12;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1001A8A24(v9);
  swift_bridgeObjectRelease(v9);

  return v12;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC5Music33LibraryArtistDetailViewController *v11;
  uint64_t v12;
  id v13;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5, v10);
  v11 = self;
  v12 = sub_10016ED00();
  v13 = objc_msgSend(*(id *)(v12 + 16), "searchBar");
  objc_msgSend(v13, "resignFirstResponder");

  swift_unknownObjectRelease(a5);
  swift_release(v12);

}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  uint64_t v9;
  _TtC5Music33LibraryArtistDetailViewController *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  swift_unknownObjectRetain(a5, v9);
  v10 = self;
  sub_10017CA90(v11, v8, a5);

  swift_unknownObjectRelease(a5);
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC5Music33LibraryArtistDetailViewController *v15;
  id v16;
  _OWORD v18[3];
  uint64_t v19;
  char v20;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = 0;
  memset(v18, 0, sizeof(v18));
  v20 = 1;
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = sub_1001CC550((uint64_t)v12, (uint64_t)v18);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v16;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC5Music33LibraryArtistDetailViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1001A9B04();

}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  _TtC5Music33LibraryArtistDetailViewController *v10;
  uint64_t v11;

  v5 = type metadata accessor for UIContentUnavailableConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = self;
  sub_10017CF44();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (_TtC5Music33LibraryArtistDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001A9CF0();
}

- (_TtC5Music33LibraryArtistDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music33LibraryArtistDetailViewController *result;

  v4 = a4;
  result = (_TtC5Music33LibraryArtistDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.LibraryArtistDetailViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___globalHeaderRegistration, (uint64_t *)&unk_1011ACE50);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___headerRegistration, (uint64_t *)&unk_1011ACE50);
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___albumGridCellRegistration, (uint64_t *)&unk_1011A3DE0);
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___albumListCellRegistration, (uint64_t *)&unk_1011A3E40);
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___musicVideoGridCellRegistration, (uint64_t *)&unk_1011A3E70);
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___musicVideoListCellRegistration, (uint64_t *)&unk_1011B8C00);
  v3 = (char *)self + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController_artist;
  v4 = type metadata accessor for Artist(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___collectionView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController_layoutVariantController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController_albumsResponseController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController_musicVideosResponseController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController_artistResponse));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController_artistResponseSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController_prefetchingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController_artistHeader));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController_dragDropController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___searchController));
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___actionMetricsReportingContext, (uint64_t *)&unk_1011A9990);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController_sortBinding));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music33LibraryArtistDetailViewController____lazy_storage___favoriteButton));
}

@end
