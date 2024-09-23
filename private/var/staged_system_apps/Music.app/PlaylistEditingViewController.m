@implementation PlaylistEditingViewController

- (_TtC5Music29PlaylistEditingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1007421A8();
}

- (void)viewDidLoad
{
  _TtC5Music29PlaylistEditingViewController *v2;

  v2 = self;
  sub_100730048();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC5Music29PlaylistEditingViewController *v4;

  v4 = self;
  sub_10073260C(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC5Music29PlaylistEditingViewController *v2;

  v2 = self;
  sub_1007328B8();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  uint64_t v8;
  uint64_t v9;
  _TtC5Music29PlaylistEditingViewController *v10;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v8 = *(_QWORD *)&a3.width;
  v9 = *(_QWORD *)&a3.height;
  swift_unknownObjectRetain(a4, a2);
  v10 = self;
  sub_10073F398(v8, v9, 0);
  v11.receiver = v10;
  v11.super_class = (Class)type metadata accessor for PlaylistEditingViewController(0);
  -[PlaylistEditingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);

  swift_unknownObjectRelease(a4);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v5;
  _TtC5Music29PlaylistEditingViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100732A9C(v5, a4);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;

  v4 = *(_QWORD *)(self + OBJC_IVAR____TtC5Music29PlaylistEditingViewController_editController);
  if (v4)
  {
    v5 = (void *)self;
    v6 = a3;
    v7 = v5;
    v8 = swift_retain(v4);
    v9 = dispatch thunk of MusicLibraryPlaylistEditViewModel.entries.getter(v8);
    swift_release(v4);
    v10 = *(_QWORD *)(v9 + 16);

    swift_bridgeObjectRelease(v9);
    return v10;
  }
  else
  {
    __break(1u);
  }
  return self;
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
  _TtC5Music29PlaylistEditingViewController *v17;
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
  v18 = (void *)sub_100733178((uint64_t)v16, v13, v15, (uint64_t)v12);
  swift_bridgeObjectRelease();

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
  _TtC5Music29PlaylistEditingViewController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1007333C8((uint64_t)v11, (uint64_t)v10);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return sub_1007337AC(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_10074237C);
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  _TtC5Music29PlaylistEditingViewController *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v19 - v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  sub_10073BAD0();

  v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v12, v9);
  v18(v15, v9);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_1007337AC(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_100742520);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music29PlaylistEditingViewController *v12;
  objc_class *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100734628();
  -[objc_class setEnabled:](v13, "setEnabled:", -[PlaylistEditingViewController isEditing](v12, "isEditing"));

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music29PlaylistEditingViewController *v12;
  objc_class *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100734628();
  v14 = objc_msgSend(v11, "indexPathsForSelectedItems");
  if (v14)
  {
    v15 = v14;
    v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v14, v7);

    v17 = *(_QWORD *)(v16 + 16);
    swift_bridgeObjectRelease();
    v18 = v17 != 0;
  }
  else
  {
    v18 = 0;
  }
  -[objc_class setEnabled:](v13, "setEnabled:", v18);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC5Music29PlaylistEditingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music29PlaylistEditingViewController *result;

  v4 = a4;
  result = (_TtC5Music29PlaylistEditingViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.PlaylistEditingViewController", 35, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5[19];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___mainLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___cancelNavigationBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___doneNavigationBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___deleteToolBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___addToolBarButtonItem));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController_metadataHeaderView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___musicPickerHostingView));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC5Music29PlaylistEditingViewController_playlist;
  v4 = type metadata accessor for Playlist(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29PlaylistEditingViewController_currentUserUploadImage));
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___headerRegistration, &qword_1011C6760);
  sub_100065228((uint64_t)self + OBJC_IVAR____TtC5Music29PlaylistEditingViewController_metadataView, (uint64_t)v5, &qword_1011C65E8);
  sub_100741ED4(v5);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music29PlaylistEditingViewController____lazy_storage___cellRegistration, &qword_1011C6738);
  swift_release();
  swift_release();
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4;
  _TtC5Music29PlaylistEditingViewController *v5;
  char v6;
  char v7;

  v4 = a3;
  v5 = self;
  if ((sub_10073792C() & 1) != 0)
  {

    v6 = 0;
  }
  else
  {
    v7 = *((_BYTE *)&v5->super.super.super.isa
         + OBJC_IVAR____TtC5Music29PlaylistEditingViewController_hasTracklistChanges);

    v6 = v7 ^ 1;
  }
  return v6 & 1;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4;
  _TtC5Music29PlaylistEditingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10073EC1C();

}

@end
