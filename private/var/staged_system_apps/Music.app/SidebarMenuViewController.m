@implementation SidebarMenuViewController

- (_TtC5Music25SidebarMenuViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1008D23AC();
}

- (void)viewDidLoad
{
  _TtC5Music25SidebarMenuViewController *v2;

  v2 = self;
  sub_1008BC1A0();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void (*v5)(id, _UNKNOWN **, __n128);
  __n128 v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SidebarMenuViewController(0);
  v4 = v7.receiver;
  -[SidebarMenuViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  v5 = *(void (**)(id, _UNKNOWN **, __n128))(*(_QWORD *)*CloudLibrary.StatusObserver.shared.unsafeMutableAddressor()
                                                      + 224);
  v6 = swift_retain();
  v5(v4, &off_1010E05D0, v6);

  swift_release();
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void (*v5)(id, _UNKNOWN **, __n128);
  __n128 v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SidebarMenuViewController(0);
  v4 = v7.receiver;
  -[SidebarMenuViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  v5 = *(void (**)(id, _UNKNOWN **, __n128))(*(_QWORD *)*CloudLibrary.StatusObserver.shared.unsafeMutableAddressor()
                                                      + 232);
  v6 = swift_retain();
  v5(v4, &off_1010E05D0, v6);

  swift_release();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC5Music25SidebarMenuViewController *v6;

  v6 = self;
  sub_1008C5894(a3, a4);

}

- (void)viewDidLayoutSubviews
{
  _TtC5Music25SidebarMenuViewController *v2;

  v2 = self;
  sub_1008C62E4();

}

- (void)presentRazzmatazz:(id)a3
{
  id v4;
  _TtC5Music25SidebarMenuViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1008CBB3C(v4);

}

- (_TtC5Music25SidebarMenuViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music25SidebarMenuViewController *result;

  v4 = a4;
  result = (_TtC5Music25SidebarMenuViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.SidebarMenuViewController", 31, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1005CB898(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music25SidebarMenuViewController_editedLibraryMenu), *(void **)&self->editedLibraryMenu[OBJC_IVAR____TtC5Music25SidebarMenuViewController_editedLibraryMenu], *(_QWORD *)&self->editedLibraryMenu[OBJC_IVAR____TtC5Music25SidebarMenuViewController_editedLibraryMenu + 8], *(_QWORD *)&self->editedLibraryMenu[OBJC_IVAR____TtC5Music25SidebarMenuViewController_editedLibraryMenu + 16], *(_QWORD *)&self->editedLibraryMenu[OBJC_IVAR____TtC5Music25SidebarMenuViewController_editedLibraryMenu + 24], *(_QWORD *)&self->editedLibraryMenu[OBJC_IVAR____TtC5Music25SidebarMenuViewController_editedLibraryMenu + 32]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music25SidebarMenuViewController_onUserSelection), *(_QWORD *)&self->editedLibraryMenu[OBJC_IVAR____TtC5Music25SidebarMenuViewController_onUserSelection]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music25SidebarMenuViewController_onSelectedItemChanged), *(_QWORD *)&self->editedLibraryMenu[OBJC_IVAR____TtC5Music25SidebarMenuViewController_onSelectedItemChanged]);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music25SidebarMenuViewController_selectedItem, (uint64_t *)&unk_1011CEE40);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music25SidebarMenuViewController_pendingSelectedItem, (uint64_t *)&unk_1011CEE40);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25SidebarMenuViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25SidebarMenuViewController_dataSource));
  swift_bridgeObjectRelease();
  swift_release();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music25SidebarMenuViewController_sharedLibrarySelectionObserver, (uint64_t *)&unk_1011A3850);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music25SidebarMenuViewController_availableSharedLibrariesObserver, (uint64_t *)&unk_1011A3850);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25SidebarMenuViewController____lazy_storage___contextBarButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25SidebarMenuViewController____lazy_storage___contextBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25SidebarMenuViewController____lazy_storage___enableCloudLibraryButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25SidebarMenuViewController____lazy_storage___cloudLibraryLoadingButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25SidebarMenuViewController____lazy_storage___cloudLibraryLoadingSpinner));
  swift_release();
  swift_release();
  swift_release();
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  _TtC5Music25SidebarMenuViewController *v15;
  char v16;
  uint64_t v18;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  swift_unknownObjectRetain(a5, v14);
  v15 = self;
  sub_1008D28F0((uint64_t)v13, (uint64_t)v12);
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
  _TtC5Music25SidebarMenuViewController *v12;
  char v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1008D2EB4((uint64_t)v10);
  LOBYTE(self) = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_1008CE1C0(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))sub_1008CC5B4);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music25SidebarMenuViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1008CC818(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return sub_1008CE1C0(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))sub_1008CDDA4);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music25SidebarMenuViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1008D302C((uint64_t)v10);

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
  _TtC5Music25SidebarMenuViewController *v20;
  void (*v21)(char *, uint64_t);
  Class isa;
  uint64_t v24;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v24 - v14;
  __chkstk_darwin(v16);
  v18 = (char *)&v24 - v17;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = a3;
  v20 = self;
  sub_1008CE330((uint64_t)v15, (uint64_t)v12, v18);

  v21 = *(void (**)(char *, uint64_t))(v10 + 8);
  v21(v12, v9);
  v21(v15, v9);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v21(v18, v9);
  return isa;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC5Music25SidebarMenuViewController *v11;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5, v10);
  v11 = self;
  sub_1008D3208(v9, a5);

  swift_unknownObjectRelease(a5);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Music25SidebarMenuViewController *v11;
  id v12;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = self;
  v12 = sub_1008D34F8(v10, v9);

  swift_bridgeObjectRelease();
  return v12;
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v9;
  void *v10;
  _TtC5Music25SidebarMenuViewController *v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[6];

  if (a5)
  {
    v9 = swift_allocObject(&unk_1010E05F0, 24, 7);
    *(_QWORD *)(v9 + 16) = self;
    v15[4] = sub_1008D3B30;
    v15[5] = v9;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 1107296256;
    v15[2] = sub_1001DBD98;
    v15[3] = &unk_1010E0608;
    v10 = _Block_copy(v15);
    v11 = self;
    v12 = a3;
    v13 = a4;
    swift_unknownObjectRetain(a5, v14);
    objc_msgSend(a5, "addCompletion:", v10, swift_release().n128_f64[0]);
    _Block_release(v10);

    swift_unknownObjectRelease(a5);
  }
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC5Music25SidebarMenuViewController *v15;
  id v16;
  uint64_t v18;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = sub_1008D3A04(v13, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v16;
}

@end
