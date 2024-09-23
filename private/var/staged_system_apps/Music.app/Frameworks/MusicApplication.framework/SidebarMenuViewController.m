@implementation SidebarMenuViewController

- (_TtC16MusicApplication25SidebarMenuViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_3EF5B8();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication25SidebarMenuViewController *v2;

  v2 = self;
  sub_3DC1B8();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(id, _UNKNOWN **, __n128);
  __n128 v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SidebarMenuViewController(0);
  v4 = v9.receiver;
  -[SidebarMenuViewController viewDidAppear:](&v9, "viewDidAppear:", v3);
  v5 = CloudLibrary.StatusObserver.shared.unsafeMutableAddressor();
  v6 = *v5;
  v7 = *(void (**)(id, _UNKNOWN **, __n128))(*(_QWORD *)*v5 + 224);
  v8 = swift_retain(*v5);
  v7(v4, &off_13607F8, v8);

  swift_release(v6);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(id, _UNKNOWN **, __n128);
  __n128 v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SidebarMenuViewController(0);
  v4 = v9.receiver;
  -[SidebarMenuViewController viewDidDisappear:](&v9, "viewDidDisappear:", v3);
  v5 = CloudLibrary.StatusObserver.shared.unsafeMutableAddressor();
  v6 = *v5;
  v7 = *(void (**)(id, _UNKNOWN **, __n128))(*(_QWORD *)*v5 + 232);
  v8 = swift_retain(*v5);
  v7(v4, &off_13607F8, v8);

  swift_release(v6);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC16MusicApplication25SidebarMenuViewController *v6;

  v6 = self;
  sub_3E3C9C(a3, a4);

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication25SidebarMenuViewController *v2;

  v2 = self;
  sub_3E46F8();

}

- (_TtC16MusicApplication25SidebarMenuViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication25SidebarMenuViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication25SidebarMenuViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SidebarMenuViewController", 42, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2F9F9C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_editedLibraryMenu), *(void **)&self->editedLibraryMenu[OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_editedLibraryMenu], *(_QWORD *)&self->editedLibraryMenu[OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_editedLibraryMenu+ 8], *(_QWORD *)&self->editedLibraryMenu[OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_editedLibraryMenu+ 16], *(_QWORD *)&self->editedLibraryMenu[OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_editedLibraryMenu+ 24], *(_QWORD *)&self->editedLibraryMenu[OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_editedLibraryMenu+ 32]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_onUserSelection), *(_QWORD *)&self->editedLibraryMenu[OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_onUserSelection]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_onSelectedItemChanged), *(_QWORD *)&self->editedLibraryMenu[OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_onSelectedItemChanged]);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_selectedItem, (uint64_t *)&unk_14C7F40);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_pendingSelectedItem, (uint64_t *)&unk_14C7F40);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController____lazy_storage___requestResponseController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_cloudLibraryEnableNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_downloadsController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_dataSource));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_bindings));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController____lazy_storage___sharedLibrariesController));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_sharedLibrarySelectionObserver, (uint64_t *)&unk_14C06B0);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_availableSharedLibrariesObserver, (uint64_t *)&unk_14C06B0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_libraryFilter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController____lazy_storage___contextBarButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController____lazy_storage___contextBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController____lazy_storage___enableCloudLibraryButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController____lazy_storage___cloudLibraryLoadingButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController____lazy_storage___cloudLibraryLoadingSpinner));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_artworkCache));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_loadingContext));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25SidebarMenuViewController_dragDropController));
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC16MusicApplication25SidebarMenuViewController *v15;
  char v16;
  uint64_t v18;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  v14 = a4;
  swift_unknownObjectRetain(a5);
  v15 = self;
  sub_3EFBC0((uint64_t)v13, (uint64_t)v12);
  LOBYTE(self) = v16;

  swift_unknownObjectRelease(a5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  return self & 1;
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication25SidebarMenuViewController *v13;
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
  sub_3F0194((uint64_t)v10);
  LOBYTE(self) = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_3EC2A8(self, (uint64_t)a2, a3, a4, (uint64_t (*)(id, char *))sub_3EA4F8);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication25SidebarMenuViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_3EA764(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return sub_3EC2A8(self, (uint64_t)a2, a3, a4, (uint64_t (*)(id, char *))sub_3EBE80);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication25SidebarMenuViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_3F0310((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  id v21;
  _TtC16MusicApplication25SidebarMenuViewController *v22;
  void (*v23)(char *, uint64_t);
  Class isa;
  uint64_t v26;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v26 - v14;
  __chkstk_darwin(v16);
  v18 = (char *)&v26 - v17;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_3EC438((uint64_t)v15, (uint64_t)v12, v18);

  v23 = *(void (**)(char *, uint64_t))(v10 + 8);
  v23(v12, v9);
  v23(v15, v9);

  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v23(v18, v9);
  return isa;
}

@end
