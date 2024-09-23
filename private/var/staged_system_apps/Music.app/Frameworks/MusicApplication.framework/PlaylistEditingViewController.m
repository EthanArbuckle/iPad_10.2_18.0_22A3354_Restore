@implementation PlaylistEditingViewController

- (_TtC16MusicApplication29PlaylistEditingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_85FD9C();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication29PlaylistEditingViewController *v2;

  v2 = self;
  sub_84E438();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC16MusicApplication29PlaylistEditingViewController *v4;

  v4 = self;
  sub_850A9C(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication29PlaylistEditingViewController *v2;

  v2 = self;
  sub_850D48();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  uint64_t v8;
  uint64_t v9;
  _TtC16MusicApplication29PlaylistEditingViewController *v10;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v8 = *(_QWORD *)&a3.width;
  v9 = *(_QWORD *)&a3.height;
  swift_unknownObjectRetain(a4);
  v10 = self;
  sub_85DA4C(v8, v9, 0);
  v11.receiver = v10;
  v11.super_class = (Class)type metadata accessor for PlaylistEditingViewController(0);
  -[PlaylistEditingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);

  swift_unknownObjectRelease(a4);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v5;
  _TtC16MusicApplication29PlaylistEditingViewController *v6;

  v5 = a3;
  v6 = self;
  sub_850F2C(v5, a4);

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

  v4 = *(_QWORD *)(self + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController_editController);
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
  id v17;
  id v18;
  _TtC16MusicApplication29PlaylistEditingViewController *v19;
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
  v20 = (void *)sub_85160C((uint64_t)v16, v13, v15, (uint64_t)v12);

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
  _TtC16MusicApplication29PlaylistEditingViewController *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_851878((uint64_t)v11, (uint64_t)v10);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return sub_F34D8(self, (uint64_t)a2, a3, a4, (uint64_t (*)(char *))sub_85FF70);
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
  id v17;
  id v18;
  _TtC16MusicApplication29PlaylistEditingViewController *v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v21 - v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = self;
  sub_85A1A4();

  v20 = *(void (**)(char *, uint64_t))(v10 + 8);
  v20(v12, v9);
  v20(v15, v9);

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_F34D8(self, (uint64_t)a2, a3, a4, (uint64_t (*)(char *))sub_860114);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication29PlaylistEditingViewController *v13;
  objc_class *v14;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = sub_852A44();
  -[objc_class setEnabled:](v14, "setEnabled:", -[PlaylistEditingViewController isEditing](v13, "isEditing"));

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication29PlaylistEditingViewController *v13;
  objc_class *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = sub_852A44();
  v15 = objc_msgSend(v11, "indexPathsForSelectedItems");
  if (v15)
  {
    v16 = v15;
    v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v15, v7);

    v18 = *(_QWORD *)(v17 + 16);
    swift_bridgeObjectRelease();
    v19 = v18 != 0;
  }
  else
  {
    v19 = 0;
  }
  -[objc_class setEnabled:](v14, "setEnabled:", v19);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC16MusicApplication29PlaylistEditingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication29PlaylistEditingViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication29PlaylistEditingViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.PlaylistEditingViewController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5[19];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController____lazy_storage___mainLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController____lazy_storage___cancelNavigationBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController____lazy_storage___doneNavigationBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController____lazy_storage___deleteToolBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController____lazy_storage___addToolBarButtonItem));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController____lazy_storage___metadataViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController_metadataHeaderView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController____lazy_storage___musicPickerDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController____lazy_storage___musicPickerHostingView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController_musicPickerSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController_editController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController_editControllerEntriesSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController_metadataTitleSubscription));
  v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController_playlist;
  v4 = type metadata accessor for Playlist(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController_currentUserUploadImage));
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController____lazy_storage___headerRegistration, &qword_14E4DF0);
  sub_5C090((uint64_t)self + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController_metadataView, (uint64_t)v5, &qword_14E4CB8);
  sub_860A58(v5);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController____lazy_storage___cellRegistration, &qword_14E4DC8);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController_keyboardWillShowNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController_keyboardWillHideNotificationObserver));
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4;
  _TtC16MusicApplication29PlaylistEditingViewController *v5;
  char v6;
  char v7;

  v4 = a3;
  v5 = self;
  if ((sub_855D70() & 1) != 0)
  {

    v6 = 0;
  }
  else
  {
    v7 = *((_BYTE *)&v5->super.super.super.isa
         + OBJC_IVAR____TtC16MusicApplication29PlaylistEditingViewController_hasTracklistChanges);

    v6 = v7 ^ 1;
  }
  return v6 & 1;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4;
  _TtC16MusicApplication29PlaylistEditingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_85D2D0();

}

@end
