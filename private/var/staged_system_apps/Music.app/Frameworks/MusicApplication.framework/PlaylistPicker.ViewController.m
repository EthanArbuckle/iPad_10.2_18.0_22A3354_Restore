@implementation PlaylistPicker.ViewController

- (_TtCO16MusicApplication14PlaylistPicker14ViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_40F1E4();
}

- (void)viewDidLoad
{
  _TtCO16MusicApplication14PlaylistPicker14ViewController *v2;

  v2 = self;
  sub_404A80();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtCO16MusicApplication14PlaylistPicker14ViewController *v4;

  v4 = self;
  sub_407F28(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtCO16MusicApplication14PlaylistPicker14ViewController *v2;

  v2 = self;
  sub_408110();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  uint64_t v8;
  uint64_t v9;
  _TtCO16MusicApplication14PlaylistPicker14ViewController *v10;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v8 = *(_QWORD *)&a3.width;
  v9 = *(_QWORD *)&a3.height;
  swift_unknownObjectRetain(a4);
  v10 = self;
  sub_40C4C0(v8, v9, 0);
  v11.receiver = v10;
  v11.super_class = (Class)type metadata accessor for PlaylistPicker.ViewController(0);
  -[PlaylistPicker.ViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtCO16MusicApplication14PlaylistPicker14ViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_40F6B8();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtCO16MusicApplication14PlaylistPicker14ViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_40F8D8(a4);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtCO16MusicApplication14PlaylistPicker14ViewController *v13;
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
  v14 = (void *)sub_40838C((uint64_t)v11, (unint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id result;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _TtCO16MusicApplication14PlaylistPicker14ViewController *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[24];

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_14C8638);
  __chkstk_darwin(v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for IndexPath(0);
  v26 = *(_QWORD *)(v12 - 8);
  v27 = v12;
  __chkstk_darwin(v12);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = (char *)self + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_headerRegistration;
  swift_beginAccess((char *)self + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_headerRegistration, v28, 0, 0);
  sub_5C238((uint64_t)v15, (uint64_t)v11, &qword_14C8638);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_14C8530);
  v17 = *(_QWORD *)(v16 - 8);
  result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v11, 1, v16);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v19 = sub_4E684(0, (unint64_t *)&unk_14AD5C0, UICollectionViewListCell_ptr);
    v20 = a3;
    v21 = a4;
    v22 = a5;
    v23 = self;
    v24 = (void *)UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)(v11, v14, v19);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v11, v16);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
    return v24;
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
  id v15;
  _TtCO16MusicApplication14PlaylistPicker14ViewController *v16;
  uint64_t v17;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  sub_40FCC0(v13, v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtCO16MusicApplication14PlaylistPicker14ViewController *v13;
  char v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = sub_410178(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14 & 1;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtCO16MusicApplication14PlaylistPicker14ViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_4092C4(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtCO16MusicApplication14PlaylistPicker14ViewController *v12;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v9 = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_410340(v7, v9);

  swift_bridgeObjectRelease(v9);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;
  _TtCO16MusicApplication14PlaylistPicker14ViewController *v5;

  v4 = a3;
  v5 = self;
  sub_4103BC();

}

- (_TtCO16MusicApplication14PlaylistPicker14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtCO16MusicApplication14PlaylistPicker14ViewController *result;

  v4 = a4;
  result = (_TtCO16MusicApplication14PlaylistPicker14ViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.ViewController", 31, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_tracksToAdd;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AE7A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_D5C64(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_containerSource), *(_QWORD *)&self->containerSource[OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_containerSource], *(_QWORD *)&self->containerSource[OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_containerSource+ 8]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_selectHandler), *(_QWORD *)&self->containerSource[OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_selectHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_newPlaylistHandler), *(_QWORD *)&self->containerSource[OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_newPlaylistHandler]);
  sub_56024((uint64_t)self + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_folder, (uint64_t *)&unk_14AE650);
  swift_bridgeObjectRelease(*(_QWORD *)&self->containerSource[OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_searchText]);
  sub_56024((uint64_t)self + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_recentPlaylists, (uint64_t *)&unk_14C8540);
  sub_56024((uint64_t)self + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_allPlaylists, (uint64_t *)&unk_14C81B0);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_recentPlaylistsResponse));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_allPlaylistsResponse));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_recentPlaylistsResponseSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_allPlaylistsResponseSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_searchController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_playlistContainsDuplicatesCache));
  sub_56024((uint64_t)self + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_newPlaylistCellRegistration, (uint64_t *)&unk_14C8608);
  sub_56024((uint64_t)self + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_playlistCellRegistration, &qword_14C8600);
  sub_56024((uint64_t)self + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_folderCellRegistration, (uint64_t *)&unk_14C82A0);
  sub_56024((uint64_t)self + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController_headerRegistration, &qword_14C8638);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO16MusicApplication14PlaylistPicker14ViewController____lazy_storage___collectionViewLayout));
}

@end
