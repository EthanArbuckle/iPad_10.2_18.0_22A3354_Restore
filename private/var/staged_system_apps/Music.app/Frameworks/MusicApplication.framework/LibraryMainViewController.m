@implementation LibraryMainViewController

- (void)viewDidLoad
{
  _TtC16MusicApplication25LibraryMainViewController *v2;

  v2 = self;
  sub_2EDC60();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC16MusicApplication25LibraryMainViewController *v4;

  v3 = a3;
  v4 = self;
  sub_2F1D60(v3);

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
  sub_2EF6C8(3u);

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
  v4[OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_allowsAnimatedChanges] = 0;
  v5 = OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_shouldSkipRecordingPageMetrics;
  v6 = v4[OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_shouldSkipRecordingPageMetrics];
  v4[OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_shouldSkipRecordingPageMetrics] = 1;
  sub_2F1FE8(0, 0);
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
  sub_2F1C0C(0);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC16MusicApplication25LibraryMainViewController *v6;

  v6 = self;
  sub_2F1FE8(a3, a4);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC16MusicApplication25LibraryMainViewController *v6;
  int64_t v7;

  v4 = qword_14AAE88;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once(&qword_14AAE88, sub_2F8D40);
  v7 = *(_QWORD *)(qword_157FE18 + 16);

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC16MusicApplication25LibraryMainViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_2FA4BC(a4);

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
  id v17;
  id v18;
  _TtC16MusicApplication25LibraryMainViewController *v19;
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
  v20 = (void *)sub_2F6B50((uint64_t)v16, v13, v15, (uint64_t)v12);

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
  void (*v11)(char *, uint64_t, uint64_t);
  id v12;
  _TtC16MusicApplication25LibraryMainViewController *v13;
  id v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (void (*)(char *, uint64_t, uint64_t))a3;
  v12 = a4;
  v13 = self;
  v14 = sub_2F6E24(v11, v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication25LibraryMainViewController *v13;
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
  v14 = sub_2FA600(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14 & 1;
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication25LibraryMainViewController *v13;
  char v14;
  unsigned __int8 v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  if ((UICollectionView.isDraggingCell(at:)() & 1) != 0)
  {

    v14 = 0;
  }
  else
  {
    v15 = objc_msgSend(v11, "isEditing");

    v14 = v15 ^ 1;
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v14;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication25LibraryMainViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_2FA79C((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  sub_2F850C(self, (uint64_t)a2, a3, a4, 0);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  sub_2F850C(self, (uint64_t)a2, a3, a4, 1);
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v12;

  v6 = type metadata accessor for IndexPath(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = a4;
  LOBYTE(self) = -[LibraryMainViewController isEditing](self, "isEditing");
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return (char)self;
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
  _TtC16MusicApplication25LibraryMainViewController *v19;
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
  sub_2FAF48();

  v20 = *(void (**)(char *, uint64_t))(v10 + 8);
  v20(v12, v9);
  v20(v15, v9);

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC16MusicApplication25LibraryMainViewController *v12;
  void *v13;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = a4;
  v12 = self;
  v13 = (void *)sub_2FB240(v9);

  swift_bridgeObjectRelease(v9);
  return v13;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication25LibraryMainViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_2FB6B4(v9, a5);

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
  _TtC16MusicApplication25LibraryMainViewController *v16;
  id result;
  unint64_t v18;
  id v19;
  _OWORD v20[3];
  uint64_t v21;
  char v22;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  result = (id)IndexPath.section.getter(v16);
  v18 = (unint64_t)result;
  if (qword_14AAE88 == -1)
  {
    if (((unint64_t)result & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  result = (id)swift_once(&qword_14AAE88, sub_2F8D40);
  if ((v18 & 0x8000000000000000) != 0)
    goto LABEL_9;
LABEL_3:
  if (v18 >= *(_QWORD *)(qword_157FE18 + 16))
  {
LABEL_10:
    __break(1u);
    return result;
  }
  if (*(_BYTE *)(qword_157FE18 + v18 + 32) == 2)
  {
    v21 = 0;
    memset(v20, 0, sizeof(v20));
    v22 = 1;
    v19 = sub_58B5C8((uint64_t)v12, (uint64_t)v20);

  }
  else
  {

    v19 = 0;
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v19;
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC16MusicApplication25LibraryMainViewController *v11;
  uint64_t v12;

  v5 = type metadata accessor for UIContentUnavailableConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = a3;
  v11 = self;
  sub_2F8A14();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)presentRazzmatazz:(id)a3
{
  id v4;
  _TtC16MusicApplication25LibraryMainViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2F900C(v4);

}

- (_TtC16MusicApplication25LibraryMainViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2FB9E0();
}

- (_TtC16MusicApplication25LibraryMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication25LibraryMainViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication25LibraryMainViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.LibraryMainViewController", 42, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController____lazy_storage___globalHeaderRegistration, (uint64_t *)&unk_14AD620);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController____lazy_storage___headerRegistration, (uint64_t *)&unk_14AD620);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController____lazy_storage___inlineBubbleTipRegistration, (uint64_t *)&unk_14C06D0);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController____lazy_storage___menuCellRegistration, &qword_14C06E0);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController____lazy_storage___recentCellRegistration, (uint64_t *)&unk_14BFED8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_prefetchingController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_menuResponseController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_recentlyAddedResponseController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_sharedLibrariesController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_libraryImportController));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_sharedLibrarySelectionObserver, (uint64_t *)&unk_14C06B0);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_inlineBubbleTipProviderObserver, (uint64_t *)&unk_14C06B0);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_availableSharedLibrariesObserver, (uint64_t *)&unk_14C06B0);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_libraryImportShouldShowViewObserver, (uint64_t *)&unk_14C06B0);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_webViewDismissedObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController____lazy_storage___downloadsController));
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController____lazy_storage___actionMetricsReportingContext, &qword_14BB530);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_libraryFilter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController____lazy_storage___downloadSpinner));
  sub_15C188(*(id *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController____lazy_storage___accountButton));
  sub_15C188(*(id *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController____lazy_storage___accountBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController____lazy_storage___contextBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController____lazy_storage___contextBarButton));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_recentlyAddedItems));
  sub_2F9F9C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_editingMenu), *(void **)&self->$__lazy_storage_$_collectionView[OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_editingMenu], *(_QWORD *)&self->$__lazy_storage_$_shouldShowLibraryImportBanner[OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_editingMenu], *(_QWORD *)&self->prefetchingController[OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_editingMenu+ 6], *(_QWORD *)&self->menuResponseController[OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_editingMenu+ 6], *(_QWORD *)&self->recentlyAddedResponseController[OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_editingMenu+ 6]);
  sub_2F9F9C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_currentMenu), *(void **)&self->$__lazy_storage_$_collectionView[OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_currentMenu], *(_QWORD *)&self->$__lazy_storage_$_shouldShowLibraryImportBanner[OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_currentMenu], *(_QWORD *)&self->prefetchingController[OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_currentMenu+ 6], *(_QWORD *)&self->menuResponseController[OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_currentMenu+ 6], *(_QWORD *)&self->recentlyAddedResponseController[OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_currentMenu+ 6]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_inlineBubbleTip));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_inlineBubbleTipProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_dragDropController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController____lazy_storage___dropIndicationView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25LibraryMainViewController_sharedLibrariesObserver));
}

@end
