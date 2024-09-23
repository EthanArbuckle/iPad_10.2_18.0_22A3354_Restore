@implementation LibraryMainViewController

- (void)viewDidLoad
{
  _TtC5Music25LibraryMainViewController *v2;

  v2 = self;
  sub_1005BFAD4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC5Music25LibraryMainViewController *v4;

  v3 = a3;
  v4 = self;
  sub_1005C39EC(v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[LibraryMainViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  sub_1005C3C10(3u);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  uint64_t v5;
  char v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = v7.receiver;
  -[LibraryMainViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
  v4[OBJC_IVAR____TtC5Music25LibraryMainViewController_allowsAnimatedChanges] = 0;
  v5 = OBJC_IVAR____TtC5Music25LibraryMainViewController_shouldSkipRecordingPageMetrics;
  v6 = v4[OBJC_IVAR____TtC5Music25LibraryMainViewController_shouldSkipRecordingPageMetrics];
  v4[OBJC_IVAR____TtC5Music25LibraryMainViewController_shouldSkipRecordingPageMetrics] = 1;
  sub_1005C3E40(0, 0);
  v4[v5] = v6;

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[LibraryMainViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  sub_1005C3898(0);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC5Music25LibraryMainViewController *v6;

  v6 = self;
  sub_1005C3E40(a3, a4);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC5Music25LibraryMainViewController *v6;
  int64_t v7;

  v4 = qword_10119C2E0;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once(&qword_10119C2E0, sub_1005CAC60);
  v7 = *(_QWORD *)(qword_10124D3B8 + 16);

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC5Music25LibraryMainViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1005CBE64(a4);

  return v8;
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
  _TtC5Music25LibraryMainViewController *v17;
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
  v18 = (void *)sub_1005C8B00((uint64_t)v16, v13, v15, (uint64_t)v12);

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
  void (*v11)(char *, uint64_t, uint64_t);
  _TtC5Music25LibraryMainViewController *v12;
  _QWORD *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (void (*)(char *, uint64_t, uint64_t))a3;
  v12 = self;
  v13 = sub_1005C8DB8(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music25LibraryMainViewController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_1005CBFA0(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music25LibraryMainViewController *v12;
  char v13;
  unsigned __int8 v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  if ((UICollectionView.isDraggingCell(at:)() & 1) != 0)
  {

    v13 = 0;
  }
  else
  {
    v14 = objc_msgSend(v11, "isEditing");

    v13 = v14 ^ 1;
  }
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
  _TtC5Music25LibraryMainViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1005CC13C((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  sub_1005CA478(self, (uint64_t)a2, a3, (uint64_t)a4, 0);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  sub_1005CA478(self, (uint64_t)a2, a3, (uint64_t)a4, 1);
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v6 = type metadata accessor for IndexPath(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  LOBYTE(a4) = -[LibraryMainViewController isEditing](self, "isEditing");
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (char)a4;
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
  _TtC5Music25LibraryMainViewController *v17;
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
  sub_1005CC8A0();

  v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v12, v9);
  v18(v15, v9);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Music25LibraryMainViewController *v11;
  void *v12;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1005CCBA4(v9);

  swift_bridgeObjectRelease();
  return v12;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC5Music25LibraryMainViewController *v11;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5, v10);
  v11 = self;
  sub_1005CD018(v9, a5);

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
  _TtC5Music25LibraryMainViewController *v15;
  id result;
  unint64_t v17;
  id v18;
  _OWORD v19[3];
  uint64_t v20;
  char v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  result = (id)IndexPath.section.getter(v15);
  v17 = (unint64_t)result;
  if (qword_10119C2E0 == -1)
  {
    if (((unint64_t)result & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  result = (id)swift_once(&qword_10119C2E0, sub_1005CAC60);
  if ((v17 & 0x8000000000000000) != 0)
    goto LABEL_9;
LABEL_3:
  if (v17 >= *(_QWORD *)(qword_10124D3B8 + 16))
  {
LABEL_10:
    __break(1u);
    return result;
  }
  if (*(_BYTE *)(qword_10124D3B8 + v17 + 32) == 2)
  {
    v20 = 0;
    memset(v19, 0, sizeof(v19));
    v21 = 1;
    v18 = sub_1001CC550((uint64_t)v12, (uint64_t)v19);

  }
  else
  {

    v18 = 0;
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v18;
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  _TtC5Music25LibraryMainViewController *v10;
  uint64_t v11;

  v5 = type metadata accessor for UIContentUnavailableConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = self;
  sub_1005CA928();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)presentRazzmatazz:(id)a3
{
  id v4;
  _TtC5Music25LibraryMainViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1005CAF2C(v4);

}

- (_TtC5Music25LibraryMainViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005CD344();
}

- (_TtC5Music25LibraryMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music25LibraryMainViewController *result;

  v4 = a4;
  result = (_TtC5Music25LibraryMainViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.LibraryMainViewController", 31, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___globalHeaderRegistration, (uint64_t *)&unk_1011ACE50);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___headerRegistration, (uint64_t *)&unk_1011ACE50);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___inlineBubbleTipRegistration, (uint64_t *)&unk_1011BC850);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___menuCellRegistration, &qword_1011BC860);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___recentCellRegistration, (uint64_t *)&unk_1011CF320);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController_prefetchingController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController_sharedLibrarySelectionObserver, (uint64_t *)&unk_1011A3850);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController_inlineBubbleTipProviderObserver, (uint64_t *)&unk_1011A3850);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController_availableSharedLibrariesObserver, (uint64_t *)&unk_1011A3850);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController_libraryImportShouldShowViewObserver, (uint64_t *)&unk_1011A3850);
  swift_release();
  swift_release();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___actionMetricsReportingContext, (uint64_t *)&unk_1011A9990);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___downloadSpinner));
  sub_1003B25A8(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___accountButton));
  sub_1003B25A8(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___accountBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___contextBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___contextBarButton));
  swift_bridgeObjectRelease();
  sub_1005CB898(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music25LibraryMainViewController_editingMenu), *(void **)&self->$__lazy_storage_$_collectionView[OBJC_IVAR____TtC5Music25LibraryMainViewController_editingMenu], *(_QWORD *)&self->$__lazy_storage_$_shouldShowLibraryImportBanner[OBJC_IVAR____TtC5Music25LibraryMainViewController_editingMenu], *(_QWORD *)&self->prefetchingController[OBJC_IVAR____TtC5Music25LibraryMainViewController_editingMenu + 6], *(_QWORD *)&self->menuResponseController[OBJC_IVAR____TtC5Music25LibraryMainViewController_editingMenu + 6], *(_QWORD *)&self->recentlyAddedResponseController[OBJC_IVAR____TtC5Music25LibraryMainViewController_editingMenu + 6]);
  sub_1005CB898(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music25LibraryMainViewController_currentMenu), *(void **)&self->$__lazy_storage_$_collectionView[OBJC_IVAR____TtC5Music25LibraryMainViewController_currentMenu], *(_QWORD *)&self->$__lazy_storage_$_shouldShowLibraryImportBanner[OBJC_IVAR____TtC5Music25LibraryMainViewController_currentMenu], *(_QWORD *)&self->prefetchingController[OBJC_IVAR____TtC5Music25LibraryMainViewController_currentMenu + 6], *(_QWORD *)&self->menuResponseController[OBJC_IVAR____TtC5Music25LibraryMainViewController_currentMenu + 6], *(_QWORD *)&self->recentlyAddedResponseController[OBJC_IVAR____TtC5Music25LibraryMainViewController_currentMenu + 6]);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25LibraryMainViewController____lazy_storage___dropIndicationView));
  swift_release();
}

@end
