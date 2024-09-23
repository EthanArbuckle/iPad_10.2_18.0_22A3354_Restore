@implementation LibraryArtistDetailViewController

- (void)viewDidLoad
{
  _TtC16MusicApplication33LibraryArtistDetailViewController *v2;

  v2 = self;
  sub_6481AC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC16MusicApplication33LibraryArtistDetailViewController *v4;

  v3 = a3;
  v4 = self;
  sub_64D49C(v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MusicApplication33LibraryArtistDetailViewController *v4;

  v4 = self;
  sub_479848(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16MusicApplication33LibraryArtistDetailViewController *v4;

  v4 = self;
  sub_64D740(a3);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtC16MusicApplication33LibraryArtistDetailViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_65C120();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC16MusicApplication33LibraryArtistDetailViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_65C2E0(a4);

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
  id v17;
  id v18;
  _TtC16MusicApplication33LibraryArtistDetailViewController *v19;
  void *v20;
  uint64_t v22;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = self;
  v20 = sub_6536B0((uint64_t)v16, v13, v15, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRelease();

  return v20;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication33LibraryArtistDetailViewController *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = (void *)sub_653A44((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  id v12;
  _TtC16MusicApplication33LibraryArtistDetailViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (char *)a3;
  v12 = a4;
  v13 = self;
  sub_654A88(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC16MusicApplication33LibraryArtistDetailViewController *v12;
  void *v13;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = a4;
  v12 = self;
  v13 = (void *)sub_65C534(v9);
  swift_bridgeObjectRelease();

  return v13;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication33LibraryArtistDetailViewController *v10;
  uint64_t v11;
  id v12;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  v11 = sub_648C54();
  v12 = objc_msgSend(*(id *)(v11 + 16), "searchBar");
  objc_msgSend(v12, "resignFirstResponder");

  swift_unknownObjectRelease(a5);
  swift_release(v11);

}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  _TtC16MusicApplication33LibraryArtistDetailViewController *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  swift_unknownObjectRetain(a5);
  v9 = self;
  sub_6565D4(v10, v8, a5);

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
  id v15;
  _TtC16MusicApplication33LibraryArtistDetailViewController *v16;
  id v17;
  _OWORD v19[3];
  uint64_t v20;
  char v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v20 = 0;
  memset(v19, 0, sizeof(v19));
  v21 = 1;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  v17 = sub_58B5C8((uint64_t)v12, (uint64_t)v19);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v17;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC16MusicApplication33LibraryArtistDetailViewController *v5;

  v4 = a3;
  v5 = self;
  sub_65D614();

}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC16MusicApplication33LibraryArtistDetailViewController *v11;
  uint64_t v12;

  v5 = type metadata accessor for UIContentUnavailableConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = a3;
  v11 = self;
  sub_656A98();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (_TtC16MusicApplication33LibraryArtistDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_65D800();
}

- (_TtC16MusicApplication33LibraryArtistDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication33LibraryArtistDetailViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication33LibraryArtistDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.LibraryArtistDetailViewController", 50, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController____lazy_storage___globalHeaderRegistration, (uint64_t *)&unk_14AD620);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController____lazy_storage___headerRegistration, (uint64_t *)&unk_14AD620);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController____lazy_storage___albumGridCellRegistration, &qword_14BB538);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController____lazy_storage___albumListCellRegistration, &qword_14F95D0);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController____lazy_storage___musicVideoGridCellRegistration, &qword_14CD1B0);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController____lazy_storage___musicVideoListCellRegistration, (uint64_t *)&unk_14D7E70);
  v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController_artist;
  v4 = type metadata accessor for Artist(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController____lazy_storage___collectionView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController_layoutVariantController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController_albumsResponseController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController_musicVideosResponseController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController_artistResponse));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController_artistResponseSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController_prefetchingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController_artistHeader));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController_dragDropController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController____lazy_storage___searchController));
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController____lazy_storage___actionMetricsReportingContext, &qword_14BB530);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController_sortBinding));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33LibraryArtistDetailViewController____lazy_storage___favoriteButton));
}

@end
