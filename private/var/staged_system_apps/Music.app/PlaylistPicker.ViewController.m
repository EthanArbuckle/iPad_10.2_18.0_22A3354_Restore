@implementation PlaylistPicker.ViewController

- (_TtCO5Music14PlaylistPicker14ViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10047B1B0();
}

- (void)viewDidLoad
{
  _TtCO5Music14PlaylistPicker14ViewController *v2;

  v2 = self;
  sub_100470BFC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtCO5Music14PlaylistPicker14ViewController *v4;

  v4 = self;
  sub_1004740BC(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtCO5Music14PlaylistPicker14ViewController *v2;

  v2 = self;
  sub_10047428C();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  uint64_t v8;
  uint64_t v9;
  _TtCO5Music14PlaylistPicker14ViewController *v10;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v8 = *(_QWORD *)&a3.width;
  v9 = *(_QWORD *)&a3.height;
  swift_unknownObjectRetain(a4, a2);
  v10 = self;
  sub_1004785A8(v8, v9, 0);
  v11.receiver = v10;
  v11.super_class = (Class)type metadata accessor for PlaylistPicker.ViewController(0);
  -[PlaylistPicker.ViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtCO5Music14PlaylistPicker14ViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10047B56C();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtCO5Music14PlaylistPicker14ViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_10047B78C(a4);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtCO5Music14PlaylistPicker14ViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100474508((uint64_t)v11, (unint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id result;
  uint64_t v19;
  id v20;
  _TtCO5Music14PlaylistPicker14ViewController *v21;
  void *v22;
  _BYTE v24[24];

  v8 = sub_100007E8C((uint64_t *)&unk_1011C7200);
  __chkstk_darwin(v8);
  v10 = &v24[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = type metadata accessor for IndexPath(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = &v24[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = (char *)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_headerRegistration;
  swift_beginAccess((char *)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_headerRegistration, v24, 0, 0);
  sub_10004A160((uint64_t)v15, (uint64_t)v10, (uint64_t *)&unk_1011C7200);
  v16 = sub_100007E8C(&qword_1011B5650);
  v17 = *(_QWORD *)(v16 - 8);
  result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v19 = sub_10004A07C(0, (unint64_t *)&unk_1011AE8C0, UICollectionViewListCell_ptr);
    v20 = a3;
    v21 = self;
    v22 = (void *)UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)(v10, v14, v19);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v16);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return v22;
  }
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtCO5Music14PlaylistPicker14ViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_10047BB74(v13, v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtCO5Music14PlaylistPicker14ViewController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_10047C024(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtCO5Music14PlaylistPicker14ViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1004753EC(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtCO5Music14PlaylistPicker14ViewController *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_10047C1EC(v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;
  _TtCO5Music14PlaylistPicker14ViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10047C268();

}

- (_TtCO5Music14PlaylistPicker14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtCO5Music14PlaylistPicker14ViewController *result;

  v4 = a4;
  result = (_TtCO5Music14PlaylistPicker14ViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.ViewController", 20, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_tracksToAdd;
  v4 = sub_100007E8C((uint64_t *)&unk_1011A96F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10047C2C4(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_containerSource), *(_QWORD *)&self->containerSource[OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_containerSource], *(_QWORD *)&self->containerSource[OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_containerSource + 8]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_selectHandler), *(_QWORD *)&self->containerSource[OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_selectHandler]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_newPlaylistHandler), *(_QWORD *)&self->containerSource[OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_newPlaylistHandler]);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_folder, (uint64_t *)&unk_1011B5660);
  swift_bridgeObjectRelease(*(_QWORD *)&self->containerSource[OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_searchText]);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_recentPlaylists, &qword_1011B5680);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_allPlaylists, (uint64_t *)&unk_1011A3C50);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_searchController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_playlistContainsDuplicatesCache));
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_newPlaylistCellRegistration, (uint64_t *)&unk_1011B5748);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_playlistCellRegistration, &qword_1011B5740);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_folderCellRegistration, (uint64_t *)&unk_1011AD810);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController_headerRegistration, (uint64_t *)&unk_1011C7200);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO5Music14PlaylistPicker14ViewController____lazy_storage___collectionViewLayout));
}

@end
