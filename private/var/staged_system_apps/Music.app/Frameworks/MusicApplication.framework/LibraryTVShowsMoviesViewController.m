@implementation LibraryTVShowsMoviesViewController

- (void)viewDidLoad
{
  _TtC16MusicApplication34LibraryTVShowsMoviesViewController *v2;

  v2 = self;
  sub_55F1C0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC16MusicApplication34LibraryTVShowsMoviesViewController *v4;

  v3 = a3;
  v4 = self;
  sub_5619C4(v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16MusicApplication34LibraryTVShowsMoviesViewController *v4;

  v4 = self;
  sub_561AE8(a3);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtC16MusicApplication34LibraryTVShowsMoviesViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_568390();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC16MusicApplication34LibraryTVShowsMoviesViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_5685BC(a4);

  return v8;
}

- (id)indexTitlesForCollectionView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSArray v5;

  v3 = sub_568A98();
  if (v3)
  {
    v4 = v3;
    swift_bridgeObjectRetain();
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
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
  id v17;
  id v18;
  _TtC16MusicApplication34LibraryTVShowsMoviesViewController *v19;
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
  v20 = (void *)sub_564C30((uint64_t)v16, v13, v15, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRelease(v15);

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
  _TtC16MusicApplication34LibraryTVShowsMoviesViewController *v13;
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
  v14 = (void *)sub_564F6C((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  void (*v11)(char *, uint64_t);
  id v12;
  _TtC16MusicApplication34LibraryTVShowsMoviesViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (void (*)(char *, char *, uint64_t))((char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (void (*)(char *, uint64_t))a3;
  v12 = a4;
  v13 = self;
  sub_56591C(v11, v10);

  (*(void (**)(void (*)(char *, char *, uint64_t), uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC16MusicApplication34LibraryTVShowsMoviesViewController *v12;
  void *v13;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = a4;
  v12 = self;
  v13 = (void *)sub_568AD4(v9);

  swift_bridgeObjectRelease(v9);
  return v13;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication34LibraryTVShowsMoviesViewController *v10;
  uint64_t v11;
  id v12;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  v11 = sub_5604E4();
  v12 = objc_msgSend(*(id *)(v11 + 16), "searchBar");
  objc_msgSend(v12, "resignFirstResponder");

  swift_unknownObjectRelease(a5);
  swift_release(v11);

}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication34LibraryTVShowsMoviesViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_5696D0(v9, a5);

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
  _TtC16MusicApplication34LibraryTVShowsMoviesViewController *v16;
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

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC16MusicApplication34LibraryTVShowsMoviesViewController *v11;
  uint64_t v12;

  v5 = type metadata accessor for UIContentUnavailableConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = a3;
  v11 = self;
  sub_5673B0();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (_TtC16MusicApplication34LibraryTVShowsMoviesViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_569C14();
}

- (_TtC16MusicApplication34LibraryTVShowsMoviesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication34LibraryTVShowsMoviesViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication34LibraryTVShowsMoviesViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.LibraryTVShowsMoviesViewController", 51, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication34LibraryTVShowsMoviesViewController____lazy_storage___globalHeaderRegistration, &qword_14D3638);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication34LibraryTVShowsMoviesViewController____lazy_storage___headerRegistration, (uint64_t *)&unk_14AD620);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication34LibraryTVShowsMoviesViewController____lazy_storage___tvShowCellRegistration, &qword_14D35E8);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication34LibraryTVShowsMoviesViewController____lazy_storage___movieCellRegistration, (uint64_t *)&unk_14D35F0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication34LibraryTVShowsMoviesViewController____lazy_storage___collectionView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication34LibraryTVShowsMoviesViewController_tvShowsResponseController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication34LibraryTVShowsMoviesViewController_moviesResponseController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication34LibraryTVShowsMoviesViewController_prefetchingController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication34LibraryTVShowsMoviesViewController_dragDropController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication34LibraryTVShowsMoviesViewController____lazy_storage___searchController));
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication34LibraryTVShowsMoviesViewController____lazy_storage___actionMetricsReportingContext, &qword_14BB530);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication34LibraryTVShowsMoviesViewController____lazy_storage___sortMoviesBarButton));
}

@end
