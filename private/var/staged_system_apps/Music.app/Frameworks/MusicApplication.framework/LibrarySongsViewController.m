@implementation LibrarySongsViewController

- (void)viewDidLoad
{
  _TtC16MusicApplication26LibrarySongsViewController *v2;

  v2 = self;
  sub_7BA108();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  double v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  v4 = (char *)v11.receiver;
  -[LibrarySongsViewController viewWillAppear:](&v11, "viewWillAppear:", v3);
  v6 = sub_7BADF4(v5);
  v7 = objc_msgSend(v4, "transitionCoordinator", v11.receiver, v11.super_class);
  UICollectionView.clearSelection(using:animated:)(v7, v3);

  swift_unknownObjectRelease(v7);
  v8 = *(_QWORD *)&v4[OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController_responseController];
  v9 = *(_QWORD *)(*(_QWORD *)v8 + 128);
  v10 = *(_BYTE *)(v8 + v9);
  *(_BYTE *)(v8 + v9) = 1;
  sub_7B7FB4(v10);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MusicApplication26LibrarySongsViewController *v4;

  v4 = self;
  sub_7BC398(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = (char *)v8.receiver;
  -[LibrarySongsViewController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController_responseController];
  v6 = *(_QWORD *)(*(_QWORD *)v5 + 128);
  v7 = *(_BYTE *)(v5 + v6);
  *(_BYTE *)(v5 + v6) = 0;
  sub_7B7FB4(v7);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  __n128 v10;
  int64_t v11;
  id v12;
  _TtC16MusicApplication26LibrarySongsViewController *v13;
  uint64_t v14;
  _BYTE v17[24];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_14D7E28);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController_responseController)
     + *(_QWORD *)(**(_QWORD **)((char *)&self->super.super.super.isa
                               + OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController_responseController)
                 + 112);
  v10 = swift_beginAccess(v9, v17, 0, 0);
  v11 = 0;
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t, __n128))(v6 + 48))(v9, 1, v5, v10))
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v9, v5);
    v12 = a3;
    v13 = self;
    v14 = MusicLibrarySectionedResponse.sections.getter(v5);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v11 = *(_QWORD *)(v14 + 16);

    swift_bridgeObjectRelease();
  }
  return v11;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC16MusicApplication26LibrarySongsViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_7C1CF8(a4);

  return v8;
}

- (id)indexTitlesForCollectionView:(id)a3
{
  uint64_t v3;
  Class isa;

  v3 = *(_QWORD *)(*(char **)((char *)&self->super.super.super.isa
                            + OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController_responseController)
                 + *(_QWORD *)(**(_QWORD **)((char *)&self->super.super.super.isa
                                           + OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController_responseController)
                             + 120));
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
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
  _TtC16MusicApplication26LibrarySongsViewController *v19;
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
  v20 = (void *)sub_7BEA14((uint64_t)v16, v13, v15, (uint64_t)v12);

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
  _TtC16MusicApplication26LibrarySongsViewController *v13;
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
  v14 = sub_7BECE8((uint64_t)v11, (uint64_t)v10);

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
  _TtC16MusicApplication26LibrarySongsViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (char *)a3;
  v12 = a4;
  v13 = self;
  sub_7BEFF4(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC16MusicApplication26LibrarySongsViewController *v12;
  id v13;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = a4;
  v12 = self;
  v13 = sub_7C1F5C(v9);

  swift_bridgeObjectRelease();
  return v13;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication26LibrarySongsViewController *v10;
  uint64_t v11;
  id v12;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  v11 = sub_7BAD5C();
  v12 = objc_msgSend(*(id *)(v11 + 16), "searchBar");
  objc_msgSend(v12, "resignFirstResponder");

  swift_unknownObjectRelease(a5);
  swift_release(v11);

}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication26LibrarySongsViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_7C2478(v9, a5);

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
  _TtC16MusicApplication26LibrarySongsViewController *v16;
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
  _TtC16MusicApplication26LibrarySongsViewController *v11;
  uint64_t v12;

  v5 = type metadata accessor for UIContentUnavailableConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = a3;
  v11 = self;
  sub_7C06C8();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (_TtC16MusicApplication26LibrarySongsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_7C2874();
}

- (_TtC16MusicApplication26LibrarySongsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication26LibrarySongsViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication26LibrarySongsViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.LibrarySongsViewController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController____lazy_storage___globalHeaderRegistration, (uint64_t *)&unk_14AD620);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController____lazy_storage___headerRegistration, (uint64_t *)&unk_14AD620);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController____lazy_storage___listCellRegistration, (uint64_t *)&unk_14DF3A0);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController_waveformPlayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController____lazy_storage___collectionView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController_responseController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController_prefetchingController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController_dragDropController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController____lazy_storage___searchController));
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication26LibrarySongsViewController____lazy_storage___actionMetricsReportingContext, &qword_14BB530);
}

@end
