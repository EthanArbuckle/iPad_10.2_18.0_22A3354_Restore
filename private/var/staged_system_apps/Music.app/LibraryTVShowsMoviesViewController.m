@implementation LibraryTVShowsMoviesViewController

- (void)viewDidLoad
{
  _TtC5Music34LibraryTVShowsMoviesViewController *v2;

  v2 = self;
  sub_1008AC604();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC5Music34LibraryTVShowsMoviesViewController *v4;

  v3 = a3;
  v4 = self;
  sub_1008AEF30(v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC5Music34LibraryTVShowsMoviesViewController *v4;

  v4 = self;
  sub_1008AF054(a3);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtC5Music34LibraryTVShowsMoviesViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1008B5F88();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC5Music34LibraryTVShowsMoviesViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1008B61B4(a4);

  return v8;
}

- (id)indexTitlesForCollectionView:(id)a3
{
  NSArray v3;

  if (sub_1008B6690())
  {
    swift_bridgeObjectRetain();
    v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.isa = 0;
  }
  return v3.super.isa;
}

- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  Class isa;
  uint64_t v12;

  v6 = type metadata accessor for IndexPath(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  IndexPath.init(index:)(a5);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return isa;
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
  _TtC5Music34LibraryTVShowsMoviesViewController *v17;
  void *v18;
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
  v18 = (void *)sub_1008B2138((uint64_t)v16, v13, v15, (uint64_t)v12);

  v19 = swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
  return v18;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music34LibraryTVShowsMoviesViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1008B2458((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint8_t *, uint64_t);
  void (*v11)(char *, char *, uint64_t);
  _TtC5Music34LibraryTVShowsMoviesViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (void (*)(uint8_t *, uint64_t))((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (void (*)(char *, char *, uint64_t))a3;
  v12 = self;
  sub_1008B2DF8(v11, v10);

  (*(void (**)(_QWORD, uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Music34LibraryTVShowsMoviesViewController *v11;
  void *v12;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1008B66CC(v9);

  swift_bridgeObjectRelease();
  return v12;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC5Music34LibraryTVShowsMoviesViewController *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5, v10);
  v11 = self;
  v12 = objc_msgSend(*(id *)(sub_1008ADB48() + 16), "searchBar");
  objc_msgSend(v12, "resignFirstResponder");

  swift_unknownObjectRelease(a5);
  swift_release();

}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC5Music34LibraryTVShowsMoviesViewController *v11;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5, v10);
  v11 = self;
  sub_1008B72C8(v9, a5);

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
  _TtC5Music34LibraryTVShowsMoviesViewController *v15;
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

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  _TtC5Music34LibraryTVShowsMoviesViewController *v10;
  uint64_t v11;

  v5 = type metadata accessor for UIContentUnavailableConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = self;
  sub_1008B48F0();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (_TtC5Music34LibraryTVShowsMoviesViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1008B780C();
}

- (_TtC5Music34LibraryTVShowsMoviesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music34LibraryTVShowsMoviesViewController *result;

  v4 = a4;
  result = (_TtC5Music34LibraryTVShowsMoviesViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.LibraryTVShowsMoviesViewController", 40, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController____lazy_storage___globalHeaderRegistration, (uint64_t *)&unk_1011CEA60);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController____lazy_storage___headerRegistration, (uint64_t *)&unk_1011ACE50);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController____lazy_storage___tvShowCellRegistration, &qword_1011CEA38);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController____lazy_storage___movieCellRegistration, (uint64_t *)&unk_1011CEA40);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController____lazy_storage___collectionView));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController_prefetchingController));
  swift_release();
  swift_release();
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController____lazy_storage___actionMetricsReportingContext, (uint64_t *)&unk_1011A9990);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music34LibraryTVShowsMoviesViewController____lazy_storage___sortMoviesBarButton));
}

@end
