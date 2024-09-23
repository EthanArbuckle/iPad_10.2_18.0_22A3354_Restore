@implementation LibraryPlaylistsViewController

- (void)viewDidLoad
{
  _TtC5Music30LibraryPlaylistsViewController *v2;

  v2 = self;
  sub_10033A8B0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC5Music30LibraryPlaylistsViewController *v4;

  v3 = a3;
  v4 = self;
  sub_10033D3A4(v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Music30LibraryPlaylistsViewController *v4;

  v4 = self;
  sub_10033D5D0(a3);

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
  -[LibraryPlaylistsViewController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController_responseController];
  v6 = *(_QWORD *)(*(_QWORD *)v5 + 128);
  v7 = *(_BYTE *)(v5 + v6);
  *(_BYTE *)(v5 + v6) = 0;
  sub_1008E3AA0(v7);

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
  _TtC5Music30LibraryPlaylistsViewController *v13;
  uint64_t v14;
  _BYTE v17[24];

  v5 = sub_100007E8C(&qword_1011A3C60);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController_responseController)
     + *(_QWORD *)(**(_QWORD **)((char *)&self->super.super.super.isa
                               + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController_responseController)
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

    swift_bridgeObjectRelease(v14);
  }
  return v11;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC5Music30LibraryPlaylistsViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_100344EA4(a4);

  return v8;
}

- (id)indexTitlesForCollectionView:(id)a3
{
  uint64_t v3;
  Class isa;

  v3 = *(_QWORD *)(*(char **)((char *)&self->super.super.super.isa
                            + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController_responseController)
                 + *(_QWORD *)(**(_QWORD **)((char *)&self->super.super.super.isa
                                           + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController_responseController)
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
  __chkstk_darwin();
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
  _TtC5Music30LibraryPlaylistsViewController *v17;
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
  v18 = (void *)sub_10034081C((uint64_t)v16, v13, v15, (uint64_t)v12);

  v19 = swift_bridgeObjectRelease(v15);
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
  _TtC5Music30LibraryPlaylistsViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100340AD4((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music30LibraryPlaylistsViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100341BC8(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Music30LibraryPlaylistsViewController *v11;
  id v12;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = self;
  v12 = sub_100345108(v9);

  swift_bridgeObjectRelease(v9);
  return v12;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC5Music30LibraryPlaylistsViewController *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5, v10);
  v11 = self;
  v12 = objc_msgSend(*(id *)(sub_10033B4E8() + 16), "searchBar");
  objc_msgSend(v12, "resignFirstResponder");

  swift_unknownObjectRelease(a5);
  swift_release();

}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC5Music30LibraryPlaylistsViewController *v11;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5, v10);
  v11 = self;
  sub_1003430D8(v8, v9, a5);

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
  _TtC5Music30LibraryPlaylistsViewController *v15;
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

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  _TtC5Music30LibraryPlaylistsViewController *v15;
  uint64_t v17;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = (char *)a3;
  swift_unknownObjectRetain(a5, v14);
  v15 = self;
  LOBYTE(self) = sub_100345640(v13, (uint64_t)v12);

  swift_unknownObjectRelease(a5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return self & 1;
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  _TtC5Music30LibraryPlaylistsViewController *v10;
  uint64_t v11;

  v5 = type metadata accessor for UIContentUnavailableConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = self;
  sub_100343624();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (_TtC5Music30LibraryPlaylistsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100345A74();
}

- (_TtC5Music30LibraryPlaylistsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music30LibraryPlaylistsViewController *result;

  v4 = a4;
  result = (_TtC5Music30LibraryPlaylistsViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.LibraryPlaylistsViewController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController_pendingSelectedPlaylistItem, (uint64_t *)&unk_1011AD730);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___globalHeaderRegistration, (uint64_t *)&unk_1011ACE50);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___headerRegistration, (uint64_t *)&unk_1011ACE50);
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___listPlaylistCellRegistration, &qword_1011B5740);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___listFolderCellRegistration, (uint64_t *)&unk_1011AD810);
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___gridPlaylistCellRegistration, &qword_1011AD7F8);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___gridFolderCellRegistration, (uint64_t *)&unk_1011AD7A0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___collectionView));
  sub_10005B748((uint64_t)self + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController_scope, _s9PlaylistsV5ScopeVMa);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController_prefetchingController));
  swift_release();
  swift_release();
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtC5Music30LibraryPlaylistsViewController____lazy_storage___actionMetricsReportingContext, (uint64_t *)&unk_1011A9990);
}

@end
